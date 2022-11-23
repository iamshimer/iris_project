import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddCourseController extends GetxController {
  final _formKey = GlobalKey<FormState>();

  final courseObjectives = <String>["sss"].obs;
  final alertDialogCtlr = TextEditingController();

  set setCourseObjectives(String incObj) {
    courseObjectives.add(incObj);
  }

  List<String> get getCourseObjectives {
    return courseObjectives;
  }

  GlobalKey<FormState> get getFormKey => _formKey;

  @override
  void onClose() {
    alertDialogCtlr.dispose();
  }
}
