// ignore_for_file: avoid_print
import 'package:get/get.dart';
import 'package:iris_project/app/services/database_services.dart';

import '../../common_interface/controllers/common_interface_controller.dart';
import '../models/course_module_model.dart';

class HomeController extends GetxController {
  final CommonInterfaceController cic = Get.find();

  final lstestTenItem = <CourseModule>[].obs;

  final isLoadedHome = false.obs;
  final myFinalTutor = "".obs;

  List<CourseModule> get getLatTenItem {
    return lstestTenItem;
  }

  @override
  void onInit() {
    super.onInit();
    activityOne();
    ever(cic.isFinished, callbackFunct);
  }

  void callbackFunct(bool isReady) async {
    if (isReady == false) {
      print("returned");
      return;
    }
    if (cic.getUserAdditional != null) {
      // activityOne();
      // activityTwo();
      if (cic.isTutor) {
        print("is tutor");
        myFinalTutor.value = "tutor";
        isLoadedHome.value = true;
      } else {
        print("*******************");
        myFinalTutor.value = "student";
        isLoadedHome.value = true;
        // activityOne()
      }

      // _getFirestoreData(cic.getUserAdditional?.email);
    }
  }

  void activityOne() async {
    print("last item printed");
    final res = await DatabaseServices().getHomeDataP1();
    if (res == null || res.isEmpty) return;
    var tempList = <CourseModule>[];
    for (var doc in res) {
      tempList.add(CourseModule.fromMap(doc));
    }
    lstestTenItem.addAll(tempList);
  }

  void activityTwo() async {
    final res = await DatabaseServices().getHomeDataP1();
    if (res == null || res.isEmpty) return;
    var tempList = <CourseModule>[];
    for (var doc in res) {
      tempList.add(CourseModule.fromMap(doc));
    }
    lstestTenItem.addAll(tempList);
  }
}
