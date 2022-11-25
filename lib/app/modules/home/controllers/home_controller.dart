import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iris_project/app/services/database_services.dart';

import '../../common_interface/controllers/common_interface_controller.dart';
import '../models/announcement_model.dart';
import '../models/course_module_model.dart';

class HomeController extends GetxController {
  final CommonInterfaceController cic = Get.find();
  PageController pageController =
      PageController(viewportFraction: 0.85, initialPage: 0);

  final _lstestTenItem = <CourseModule>[].obs;
  final _lstestTenItemTwo = <AnnouncementModel>[].obs;

  final isLoadedHome = false.obs;
  final myFinalTutor = "".obs;

  List<CourseModule> get getPrimaryData {
    return _lstestTenItem;
  }

  List<AnnouncementModel> get getSecondaryData {
    return _lstestTenItemTwo;
  }

  @override
  void onInit() {
    super.onInit();
    activityOne();
    ever(cic.isFinished, callbackFunct);
  }

  void callbackFunct(bool isReady) async {
    if (isReady == false) {
      return;
    }
    if (cic.getUserAdditional != null) {
      activityTwo();
      if (cic.isTutor) {
        myFinalTutor.value = "tutor";
        isLoadedHome.value = true;
        activityTwo();
      } else {
        myFinalTutor.value = "student";
        isLoadedHome.value = true;
      }

      // _getFirestoreData(cic.getUserAdditional?.email);
    }
  }

  void activityOne() async {
    final res = await DatabaseServices().getHomeDataP1();
    if (res == null || res.isEmpty) return;
    var tempList = <CourseModule>[];
    for (var doc in res) {
      tempList.add(CourseModule.fromMap(doc));
    }
    getPrimaryData.addAll(tempList);
  }

  void activityTwo() async {
    final res = await DatabaseServices().getHomeDataP2();
    if (res == null || res.isEmpty) return;
    var tempList = <AnnouncementModel>[];
    for (var doc in res) {
      tempList.add(AnnouncementModel.fromMap(doc));
    }
    getSecondaryData.addAll(tempList);
  }
}
