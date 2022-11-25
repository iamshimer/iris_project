import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:iris_project/app/common_widgets/loading_overlay.dart';
import 'package:iris_project/app/modules/sign_up/widgets/reg_one.dart';
import 'package:iris_project/app/modules/sign_up/widgets/reg_three.dart';
import 'package:iris_project/app/modules/sign_up/widgets/reg_two.dart';

import '../controllers/sign_up_controller.dart';

class SignUpView extends GetView<SignUpController> {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: PageView(
                controller: controller.pController,
                physics: const NeverScrollableScrollPhysics(),
                children: const [RegOne(), RegTwo(), RegThree()],
              ),
            ),
            SizedBox(
              width: Get.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: Get.width * 0.3,
                    child: ElevatedButton(
                      onPressed: () {
                        if (controller.pController?.page == 0.0) {
                          controller.setRoleVal = null;
                          Get.back();
                        } else if (controller.pController?.page == 1.0) {
                          controller.makeFieldsEmptyP2();
                          controller.pController?.previousPage(
                            duration: const Duration(milliseconds: 200),
                            curve: Curves.linear,
                          );
                        } else {
                          controller.pController?.previousPage(
                            duration: const Duration(milliseconds: 200),
                            curve: Curves.linear,
                          );
                          controller.makeFieldsEmptyP3();
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          shape: const StadiumBorder()),
                      child: const Text("Back"),
                    ),
                  ),
                  Obx(() => SizedBox(
                        width: Get.width * 0.3,
                        child: ElevatedButton(
                          onPressed: controller.getRoleVal != null
                              ? () {
                                  if (controller.pController?.page == 0.0 &&
                                      controller.getRoleVal != null) {
                                    controller.pController?.nextPage(
                                        duration:
                                            const Duration(milliseconds: 200),
                                        curve: Curves.linear);
                                  } else if (controller.pController?.page ==
                                      1.0) {
                                    if (controller.formKey.currentState!
                                        .validate()) {
                                      controller.pController?.nextPage(
                                          duration:
                                              const Duration(milliseconds: 200),
                                          curve: Curves.linear);
                                    } else {}
                                  } else {
                                    if (controller.formKeyP2.currentState!
                                        .validate()) {
                                      Get.showOverlay(
                                        asyncFunction: (() =>
                                            controller.makeDataReady()),
                                        loadingWidget: const LoadingOverlay(
                                            isOverlay: true),
                                      );
                                    }
                                  }
                                }
                              : null,
                          style: ElevatedButton.styleFrom(
                              shape: const StadiumBorder()),
                          child: const Text("Next"),
                        ),
                      )),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
