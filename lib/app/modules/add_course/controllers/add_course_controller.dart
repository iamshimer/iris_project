import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

import 'package:iris_project/app/services/auth_services.dart';
import 'package:iris_project/app/services/database_services.dart';

class AddCourseController extends GetxController {
  final _formKey = GlobalKey<FormState>();

  final courseObjectives = <String>[].obs;
  final studentInstructions = <String>[].obs;
  final alertDialogObjCtrl = TextEditingController();
  final alertDialogInstCtrl = TextEditingController();
  final mediumVal = Rx<String?>(null);
  final chargeVal = Rx<String?>(null);
  final subscriptionVal = Rx<String?>(null);
  final courseNameCtrl = TextEditingController();
  final courseDescriptionCtrl = TextEditingController();

  GlobalKey<FormState> get getFormKey => _formKey;
  set setCourseObjectives(String incObj) {
    courseObjectives.add(incObj);
  }

  set setStudentInstructions(String incObj) {
    studentInstructions.add(incObj);
  }

  List<String> get getCourseObjectives {
    return courseObjectives;
  }

  List<String> get getStudentInstructions {
    return studentInstructions;
  }

  Future prepareData() async {
    final tempMap = <String, dynamic>{};
    var uuid = const Uuid();
    final nowTime = DateTime.now().millisecondsSinceEpoch;
    final user = AuthServices().getCurrentUser;
    tempMap.addIf(
        courseNameCtrl.text.isNotEmpty, "courseName", courseNameCtrl.text);
    tempMap.addIf(courseDescriptionCtrl.text.isNotEmpty, "courseDescription",
        courseDescriptionCtrl.text);
    tempMap.addIf(mediumVal.value != null, "medium", mediumVal.value);
    tempMap.addIf(chargeVal.value != null, "charge", chargeVal.value);
    tempMap.addIf(subscriptionVal.value != null, "subscriptionMode",
        subscriptionVal.value);
    tempMap.addIf(true, "courseObjectives", courseObjectives);
    tempMap.addIf(true, "studentInstructions", studentInstructions);
    tempMap.addIf(true, "createdAt", nowTime);
    tempMap.addIf(true, "updatedAt", nowTime);
    tempMap.addIf(true, "ownerUid", user?.uid);
    tempMap.addIf(true, "ownerEmail", user?.email);
    tempMap.addIf(true, "currentUsers", []);
    tempMap.addIf(true, "courseCode", uuid.v1());
    tempMap.addIf(
      true,
      "currentUserCount",
      0,
    );
    return DatabaseServices().createCourseModuleS1(tempMap);
  }

  @override
  void onClose() {
    alertDialogObjCtrl.dispose();
    alertDialogInstCtrl.dispose();
    courseDescriptionCtrl.dispose();
    courseNameCtrl.dispose();
  }
}
