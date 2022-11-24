import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:iris_project/app/modules/common_interface/controllers/common_interface_controller.dart';
import 'package:iris_project/app/services/database_services.dart';

class AddAnnouncementController extends GetxController {
  final CommonInterfaceController _cic = Get.find();

  final _formKey = GlobalKey<FormState>();

  final titleCtrl = TextEditingController();
  final messageCtrl = TextEditingController();
  final courseValue = Rx<String?>(null);
  List<String>? dropdownList = [];

  GlobalKey<FormState> get getFormKey => _formKey;

  @override
  void onInit() {
    super.onInit();
    final result =
        _cic.getUserAdditional?.myCourses?.map((e) => e.courseName).toList();
    dropdownList = result;
  }

  Future prepareData() async {
    Map<String, dynamic> tempMap = {};
    final now = DateTime.now().millisecondsSinceEpoch;
    tempMap.addIf(titleCtrl.text.isNotEmpty, "annTitle", titleCtrl.text);
    tempMap.addIf(messageCtrl.text.isNotEmpty, "annMessage", messageCtrl.text);
    tempMap.addIf(true, "annCreatedAt", now);
    tempMap.addIf(
        courseValue.value != null, "annCourseName", courseValue.value ?? "");

    tempMap.addIf(_cic.getUserAdditional != null, "annOwnerName",
        _cic.getUserAdditional?.name ?? "");
    return await DatabaseServices().addAnnouncement(tempMap);
  }

  @override
  void onClose() {
    messageCtrl.dispose();
    titleCtrl.dispose();
  }
}
