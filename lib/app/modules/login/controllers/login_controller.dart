// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../common_interface/controllers/common_interface_controller.dart';

class LoginController extends GetxController {
  final _auth = FirebaseAuth.instance;

  final emailCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();
  final passwordResetText = TextEditingController();
  final CommonInterfaceController cic = Get.find();
  final formKey = GlobalKey<FormState>();

  final isLoading = false.obs;
  final isObsecure = true.obs;

  late FocusNode emailFocus;
  late FocusNode passwordFocus;

  bool get getIsObsecure {
    return isObsecure.value;
  }

  bool get getIsLoading {
    return isLoading.value;
  }

  set setIsLoading(bool val) {
    isLoading.value = val;
  }

  @override
  void onInit() {
    super.onInit();

    emailFocus = FocusNode();
    passwordFocus = FocusNode();
  }

  @override
  void onClose() {
    emailFocus.dispose();
    passwordFocus.dispose();
    passwordResetText.dispose();
  }
}
