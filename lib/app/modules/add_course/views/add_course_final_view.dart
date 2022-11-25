import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:iris_project/app/common_widgets/common_app_bar.dart';
import 'package:iris_project/app/common_widgets/loading_overlay.dart';
import 'package:iris_project/app/modules/add_course/widgets/add_instruction.dart';
import 'package:iris_project/app/modules/add_course/widgets/add_objective.dart';
import 'package:iris_project/app/modules/common_interface/controllers/common_interface_controller.dart';

import '../controllers/add_course_controller.dart';

class AddCourseFinalView extends GetView<AddCourseController> {
  AddCourseFinalView({super.key});
  final CommonInterfaceController _cic = Get.find();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        controller.courseObjectives.value = [];
        controller.studentInstructions.value = [];
        return true;
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: returnAppBar(_cic, "Add course final"),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  children: [
                    AddObjective(
                      acc: controller,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    AddInstruction(
                      acc: controller,
                    ),
                  ],
                ),
              ),
              Center(
                child: SizedBox(
                  width: Get.width * 0.75,
                  child: ElevatedButton(
                    onPressed: () {
                      Get.showOverlay(
                        loadingWidget: const LoadingOverlay(isOverlay: true),
                        asyncFunction: () async =>
                            await controller.prepareData(),
                      );
                    },
                    child: const Text("submit"),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
