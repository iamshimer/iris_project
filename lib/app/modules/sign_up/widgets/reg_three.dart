// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iris_project/app/modules/sign_up/controllers/sign_up_controller.dart';

class RegThree extends GetView<SignUpController> {
  const RegThree({super.key});

  @override
  Widget build(BuildContext context) {
    var sizedBox = SizedBox(
      height: 30,
    );
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Form(
        key: controller.formKeyP2,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            Text(
              "Your email",
              textScaleFactor: 2,
            ),
            TextFormField(
              controller: controller.emailCtrl,
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your email.';
                } else if (!GetUtils.isEmail(value)) {
                  return "enter a valid email";
                }
                return null;
              },
            ),
            sizedBox,
            Text(
              "Your password",
              textScaleFactor: 2,
            ),
            TextFormField(
              controller: controller.passwordCtrl,
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.done,
              obscureText: true,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a password.';
                }
                return null;
              },
            ),
          ],
        ),
      ),
    );
  }
}
