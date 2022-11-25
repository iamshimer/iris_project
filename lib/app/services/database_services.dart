import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:iris_project/app/common_widgets/custom_snackbar.dart';
import 'package:iris_project/app/modules/common_interface/controllers/common_interface_controller.dart';
import 'package:iris_project/app/modules/home/models/course_module_model.dart';
import 'package:iris_project/app/modules/joined_courses/models/joined_course_model.dart';

class DatabaseServices {
  final _db = FirebaseFirestore.instance;

  Future<bool> createCourseModuleS1(Map<String, dynamic> incMap) async {
    try {
      final res = await _db.collection("courses").add(incMap);

      incMap.addIf(true, "courseDocId", res.id);

      return createCourseModuleS2(incMap);
    } on FirebaseException catch (err) {
      showFeedbackStatus(err.message, StatusValues.fail, code: err.code);
      print(err);
      return false;
    } catch (error) {
      showFeedbackStatus(null, StatusValues.fail);
      print(error);

      return false;
    }
  }

  Future<bool> createCourseModuleS2(Map<String, dynamic> incMap) async {
    try {
      incMap.remove("currentUsers");
      incMap.remove("currentUserCount");
      incMap.remove("ownerEmail");
      final oUid = incMap.remove("ownerUid");
      final roomRef = _db.collection("users").doc(oUid);
      await roomRef.update({
        "myCourses": FieldValue.arrayUnion([incMap]),
      });
      Get.back();
      Get.back();
      showFeedbackStatus("Course created successfully", StatusValues.success);
      return true;
    } on FirebaseException catch (err) {
      showFeedbackStatus(err.message, StatusValues.fail, code: err.code);
      print(err);
      return false;
    } catch (error) {
      showFeedbackStatus(null, StatusValues.fail);
      print(error);
      return false;
    }
  }

  Future<List<Map<String, dynamic>>?> getHomeDataP1() async {
    try {
      final res = await _db
          .collection("courses")
          .orderBy("createdAt", descending: true)
          .limit(10)
          .get();
      if (res.size == 0) {
        showFeedbackStatus("No data found", StatusValues.fail);

        return null;
      }

      return res.docs.map((e) {
        Map<String, dynamic> tempMap = {};
        tempMap.addAll(e.data());
        tempMap.addIf(true, "id", e.id);
        return tempMap;
      }).toList();
    } on FirebaseException catch (err) {
      showFeedbackStatus(err.message, StatusValues.fail, code: err.code);
      print(err);
      return null;
    } catch (error) {
      showFeedbackStatus(null, StatusValues.fail);
      print(error);

      return null;
    }
  }

  Future<List<Map<String, dynamic>>?> getHomeDataP2() async {
    try {
      final res = await _db
          .collection("announcements")
          .orderBy("annCreatedAt", descending: true)
          .limit(10)
          .get();
      if (res.size == 0) {
        showFeedbackStatus("No data found", StatusValues.fail);

        return null;
      }

      return res.docs.map((e) => e.data()).toList();
    } on FirebaseException catch (err) {
      showFeedbackStatus(err.message, StatusValues.fail, code: err.code);
      print(err);
      return null;
    } catch (error) {
      showFeedbackStatus(null, StatusValues.fail);
      print(error);

      return null;
    }
  }

  Future addAnnouncement(Map<String, dynamic> incMap) async {
    try {
      await _db.collection("announcements").add(incMap);
      showFeedbackStatus("Announcement submitted", StatusValues.success);
    } on FirebaseException catch (err) {
      showFeedbackStatus(err.message, StatusValues.fail, code: err.code);
      print(err);
    } catch (error) {
      showFeedbackStatus(null, StatusValues.fail);
      print(error);
    }
  }

  Future<CourseModule?> getSingleCourseModule(String path) async {
    try {
      final docRef = _db.collection("courses").doc(path);
      final res = await docRef.get();
      final data = res.data() as Map<String, dynamic>;

      return CourseModule.fromMap(data);
    } on FirebaseException catch (err) {
      showFeedbackStatus(err.message, StatusValues.fail, code: err.code);
      print(err);
      return null;
    } catch (error) {
      showFeedbackStatus(null, StatusValues.fail);
      print(error);

      return null;
    }
  }

  Future<bool> joinTheCourseP1(
      CourseModule cm, CommonInterfaceController cic) async {
    try {
      Map<String, dynamic> tempMap = {};
      final now = DateTime.now().millisecondsSinceEpoch;
      tempMap.addIf(cic.getUserAdditional != null, "stuName",
          cic.getUserAdditional?.name);
      tempMap.addIf(true, "joinedAt", now);
      tempMap.addIf(
          cic.getUserAdditional != null, "stuUid", cic.getUserAdditional?.uid);
      tempMap.addIf(cic.getUserAdditional != null, "stuEmail",
          cic.getUserAdditional?.email);
      final roomRef = _db.collection("courses").doc(cm.courseDocId);
      await roomRef.update({
        "currentUsers": FieldValue.arrayUnion([tempMap]),
        "currentUserCount": FieldValue.increment(1),
      });

      return joinTheCourseP2(cm, now, cic);
    } on FirebaseException catch (err) {
      showFeedbackStatus(err.message, StatusValues.fail, code: err.code);
      print(err);
      return false;
    } catch (error) {
      showFeedbackStatus(null, StatusValues.fail);
      print(error);

      return false;
    }
  }

  Future<bool> joinTheCourseP2(
      CourseModule cm, int now, CommonInterfaceController cic) async {
    try {
      Map<String, dynamic> tempMap = {};

      tempMap.addIf(true, "courseCode", cm.courseCode);
      tempMap.addIf(true, "joinedAt", now);
      tempMap.addIf(true, "charge", cm.charge);
      tempMap.addIf(true, "courseName", cm.courseName);
      tempMap.addIf(true, "medium", cm.medium);
      tempMap.addIf(true, "ownerEmail", cm.ownerEmail);
      tempMap.addIf(true, "ownerUid", cm.ownerUid);
      tempMap.addIf(true, "subscriptionMode", cm.subscriptionMode);

      final roomRef = _db.collection("users").doc(cic.getUserAdditional?.uid);
      await roomRef.update({
        "joinedCourses": FieldValue.arrayUnion([tempMap]),
      });
      showFeedbackStatus("Joined the course", StatusValues.success);
      return true;
    } on FirebaseException catch (err) {
      showFeedbackStatus(err.message, StatusValues.fail, code: err.code);
      print(err);
      return false;
    } catch (error) {
      showFeedbackStatus(null, StatusValues.fail);
      print(error);

      return false;
    }
  }

  Future<bool> removeFromCourseOne(
      CourseModule cm, CommonInterfaceController cic) async {
    try {
      final res = cic.getUserAdditional?.joinedCourses?.firstWhere(
        (e) => e.courseCode == cm.courseCode,
        orElse: () => JoinedCourse(
          charge: "",
          courseCode: "",
          courseName: "",
          joinedAt: 0,
          medium: "",
          ownerEmail: "",
          ownerUid: "",
          subscriptionMode: "",
        ),
      );
      if (res?.joinedAt != 0) {
        Map<String, dynamic> tempMap = {};
        tempMap.addIf(true, "joinedAt", res?.joinedAt);
        tempMap.addIf(true, "stuEmail", cic.getUserAdditional?.email);
        tempMap.addIf(true, "stuName", cic.getUserAdditional?.name);
        tempMap.addIf(true, "stuUid", cic.getUserAdditional?.uid);

        final roomRef = _db.collection("courses").doc(cm.courseDocId);
        await roomRef.update({
          "currentUsers": FieldValue.arrayRemove([tempMap]),
          "currentUserCount": FieldValue.increment(-1)
        });
        return removeFromCourseTwo(cm, res?.joinedAt, cic);
      }

      return true;
    } on FirebaseException catch (err) {
      showFeedbackStatus(err.message, StatusValues.fail, code: err.code);
      print("*-*-*-*-*-* $err");
      return false;
    } catch (error) {
      showFeedbackStatus(null, StatusValues.fail);
      print("**/*/*/**/ $error");

      return false;
    }
  }

  Future<bool> removeFromCourseTwo(
      CourseModule cm, joinedAt, CommonInterfaceController cic) async {
    try {
      Map<String, dynamic> tempMap = {};
      tempMap.addIf(true, "charge", cm.charge);
      tempMap.addIf(true, "courseCode", cm.courseCode);
      tempMap.addIf(true, "courseName", cm.courseName);
      tempMap.addIf(true, "joinedAt", joinedAt);
      tempMap.addIf(true, "medium", cm.medium);
      tempMap.addIf(true, "ownerEmail", cm.ownerEmail);
      tempMap.addIf(true, "ownerUid", cm.ownerUid);
      tempMap.addIf(true, "subscriptionMode", cm.subscriptionMode);

      final roomRef = _db.collection("users").doc(cic.getUserAdditional?.uid);
      await roomRef.update({
        "joinedCourses": FieldValue.arrayRemove([tempMap]),
      });

      return true;
    } on FirebaseException catch (err) {
      showFeedbackStatus(err.message, StatusValues.fail, code: err.code);
      print("*-*-*-*-*-* $err");
      return false;
    } catch (error) {
      showFeedbackStatus(null, StatusValues.fail);
      print("**/*/*/**/ $error");

      return false;
    }
  }
}
