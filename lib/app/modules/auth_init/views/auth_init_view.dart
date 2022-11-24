// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

import 'package:get/get.dart';
import 'package:iris_project/app/routes/app_pages.dart';
import 'package:iris_project/app/services/cloud_service.dart';

import '../controllers/auth_init_controller.dart';

class AuthInitView extends GetView<AuthInitController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Container(
        width: Get.width,
        height: Get.height,
        child: Stack(
          children: [
            Positioned(
              bottom: 0,
              child: ClipPath(
                clipper: RoundedDiagonalPathClipper(),
                child: Container(
                  height: 350,
                  width: Get.width,
                  color: Colors.cyan,
                ),
              ),
            ),
            Positioned(
              top: 0,
              child: ClipPath(
                clipper: WaveClipperTwo(flip: true),
                child: Container(
                  height: 200,
                  width: Get.width,
                  color: Colors.cyan,
                ),
              ),
            ),
            Positioned(
              top: Get.height * 0.3,
              left: Get.width * 0.25,
              child: SizedBox(
                height: 155,
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(Routes.LOGIN);
                      },
                      child: Container(
                        height: 52,
                        width: Get.width * 0.45,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(35)),
                          color: Colors.cyan,
                        ),
                        child: Center(
                          child: Text(
                            "Login",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(Routes.SIGN_UP);
                      },
                      child: Container(
                        height: 52,
                        width: Get.width * 0.45,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(35)),
                          color: Colors.cyan,
                        ),
                        child: Center(
                          child: Text(
                            "Register",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}
