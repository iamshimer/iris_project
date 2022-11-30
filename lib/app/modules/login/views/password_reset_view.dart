
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:iris_project/app/common_widgets/common_app_bar.dart';
import 'package:iris_project/app/common_widgets/custom_snackbar.dart';
import 'package:iris_project/app/common_widgets/loading_overlay.dart';
import 'package:iris_project/app/modules/common_interface/controllers/common_interface_controller.dart';
import 'package:iris_project/app/modules/login/controllers/login_controller.dart';
import 'package:iris_project/app/services/auth_services.dart';

class PasswordResetView extends GetView<LoginController> {
  final CommonInterfaceController _cic = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: returnAppBar(_cic, "Reset your password"),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                SizedBox(
                  height: 70,
                ),
                Text(
                  "Please enter your email",
                  textScaleFactor: 2.8,
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                  ),
                ),
                TextField(
                  textInputAction: TextInputAction.done,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.only(
                      left: 15,
                      right: 15,
                    ),
                    hintText: "Email",
                  ),
                  controller: controller.passwordResetText,
                  keyboardType: TextInputType.emailAddress,
                )
              ],
            ),
          ),
          SizedBox(
            width: Get.width * 0.75,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(shape: const StadiumBorder()),
                onPressed: () {
                  FocusScope.of(context).requestFocus(FocusNode());
                  if (controller.passwordResetText.text == "" ||
                      controller.passwordResetText.text.isEmpty) {
                    showFeedbackStatus(
                        "Field cannot be empty", StatusValues.fail);
                  } else if (!GetUtils.isEmail(
                      controller.passwordResetText.text)) {
                    showFeedbackStatus(
                        "Enter a valid email", StatusValues.fail);
                  } else {
                    Get.showOverlay(
                      asyncFunction: () async => await AuthServices()
                          .sendPasswordReset(controller.passwordResetText.text),
                      loadingWidget: LoadingOverlay(isOverlay: true),
                    );
                  }
                },
                child: Text("Send reset link")),
          )
        ],
      ),
    );
  }
}
