// ignore_for_file: avoid_print

import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iris_project/app/services/cloud_service.dart';

class SignUpController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final formKeyP2 = GlobalKey<FormState>();

  PageController? pController = PageController();

  final nameCtrl = TextEditingController();
  final ageCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();

  final genderValue = Rx<String?>(null);
  final roleVal = Rx<String?>(null);

  set setGenderValue(String? str) {
    genderValue.value = str;
  }

  set setRoleVal(String? str) {
    roleVal.value = str;
  }

  String? get getRoleVal {
    return roleVal.value;
  }

  bool get isStudent {
    return roleVal.value == "student" ? true : false;
  }

  void makeFieldsEmptyP2() {
    nameCtrl.clear();
    ageCtrl.clear();
    setGenderValue = null;
  }

  void makeFieldsEmptyP3() {
    emailCtrl.clear();
    passwordCtrl.clear();
  }

  Future makeDataReady() async {
    var faker = Faker();

    if (getRoleVal == null) return;
    final tempMap = <String, dynamic>{};
    final name = faker.person.name();
    print("my name is $name ");
    final email = faker.internet.freeEmail();
    tempMap.addIf(emailCtrl.text.isNotEmpty, "email", email);
    tempMap.addIf(nameCtrl.text.isNotEmpty, "name", name);
    // tempMap.addIf(true, "password", passwordCtrl.text);
    tempMap.addIf(true, "password", "32990367");
    tempMap.addIf(ageCtrl.text.isNotEmpty, "age", int.parse(ageCtrl.text));
    tempMap.addIf(genderValue.value?.isNotEmpty, "gender", genderValue.value);
    tempMap.addIf(getRoleVal?.isNotEmpty, "role", getRoleVal);
    tempMap.addIf(true, "myCourses", []);
    tempMap.addIf(true, "joinedCourses", []);

    if (getRoleVal == "tutor") {
      // tempMap.addIf(nameCtrl.text.isNotEmpty, "name", nameCtrl.text);
      // tempMap.addIf(emailCtrl.text.isNotEmpty, "email", emailCtrl.text);
      // tempMap.addIf(fieldCtrl.text.isNotEmpty, "fieldCategory", fieldCtrl.text);
    } else {
      // tempMap.addIf(nameCtrl.text.isNotEmpty, "name", nameCtrl.text);
      // tempMap.addIf(emailCtrl.text.isNotEmpty, "email", emailCtrl.text);
    }

    return await CloudService.callCloudFun(tempMap);
  }

  @override
  void onClose() {
    nameCtrl.dispose();
    ageCtrl.dispose();
    emailCtrl.dispose();
    passwordCtrl.dispose();
    pController?.dispose();
  }
}
