// ignore_for_file: avoid_print
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../common_interface/controllers/common_interface_controller.dart';

class HomeController extends GetxController {
  final CommonInterfaceController cic = Get.find();
  final db = FirebaseFirestore.instance;

  final ddf = "".obs;

  @override
  void onInit() {
    super.onInit();
    ever(cic.isFinished, callbackFunct);
  }

  void callbackFunct(bool isReady) {
    if (isReady == false) {
      print("returned");
      return;
    }
    if (cic.getUserAdditional != null) {
      print("inside ever");
      if (cic.isTutor) {
        print("is tutor");
      } else {
        print("*******************");
      }

      // _getFirestoreData(cic.getUserAdditional?.email);
    }
  }
}
