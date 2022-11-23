// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:iris_project/app/routes/app_pages.dart';
import 'package:iris_project/app/services/cloud_service.dart';

import '../controllers/auth_init_controller.dart';

class AuthInitView extends GetView<AuthInitController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Get.toNamed(Routes.LOGIN);
                },
                child: Text(
                  'Login',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
            Center(
              child: ElevatedButton(
                onPressed: () async {
                  Get.toNamed(Routes.SIGN_UP);
                },
                child: Text(
                  'Register',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
