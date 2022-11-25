import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iris_project/app/modules/sign_up/controllers/sign_up_controller.dart';

import '../../../common_widgets/common_input.borders.dart';

class RegThree extends GetView<SignUpController> {
  const RegThree({super.key});

  @override
  Widget build(BuildContext context) {
    var sizedBox = const SizedBox(
      height: 30,
    );
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: Get.width,
            height: 350,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 40,
                  width: Get.width * 0.25,
                  decoration: const BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(35),
                        bottomRight: Radius.circular(35),
                      )),
                  child: const Center(
                      child: Text(
                    "3 of 3",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                    textScaleFactor: 1.5,
                  )),
                ),
                Expanded(
                  child: SizedBox(
                    width: Get.width,
                    child: Center(
                      child: Image.asset(
                        "assets/images/pThree.png",
                        width: Get.width * 0.5,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Expanded(
            child: Form(
              key: controller.formKeyP2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.only(
                        left: 15,
                        right: 15,
                        top: 20,
                        bottom: 20,
                      ),
                      enabledBorder: outlineInputBorder,
                      focusedBorder: outlineInputBorder,
                      errorBorder: outlineInputBorder2,
                      focusedErrorBorder: outlineInputBorder2,
                      label: const Text("Email"),
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
                      contentPadding: const EdgeInsets.only(
                        left: 15,
                        right: 15,
                        top: 20,
                        bottom: 20,
                      ),
                      enabledBorder: outlineInputBorder,
                      focusedBorder: outlineInputBorder,
                      errorBorder: outlineInputBorder2,
                      focusedErrorBorder: outlineInputBorder2,
                      label: const Text("Password"),
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
          ),
        ],
      ),
    );
  }
}
