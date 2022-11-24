// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iris_project/app/modules/sign_up/controllers/sign_up_controller.dart';

import '../../../common_widgets/common_input.borders.dart';

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
            TextFormField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(
                  left: 15,
                  right: 15,
                  top: 20,
                  bottom: 20,
                ),
                enabledBorder: outlineInputBorder,
                focusedBorder: outlineInputBorder,
                errorBorder: outlineInputBorder2,
                focusedErrorBorder: outlineInputBorder2,
                hintText: "Your email",
              ),
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
            TextFormField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(
                  left: 15,
                  right: 15,
                  top: 20,
                  bottom: 20,
                ),
                enabledBorder: outlineInputBorder,
                focusedBorder: outlineInputBorder,
                errorBorder: outlineInputBorder2,
                focusedErrorBorder: outlineInputBorder2,
                hintText: "Your password",
              ),
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
