import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:iris_project/app/common_widgets/common_app_bar.dart';
import 'package:iris_project/app/modules/add_course/views/add_course_final_view.dart';
import 'package:iris_project/app/modules/common_interface/controllers/common_interface_controller.dart';

import '../controllers/add_course_controller.dart';

class AddCourseView extends GetView<AddCourseController> {
  final CommonInterfaceController _cic = Get.find();

  AddCourseView({super.key});
  @override
  Widget build(BuildContext context) {
    var inputDecoration = const InputDecoration(
      contentPadding: EdgeInsets.fromLTRB(10, 20, 10, 20),
    );
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: returnAppBar(_cic, "Add course"),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Form(
          key: controller.getFormKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    controller: controller.courseNameCtrl,
                    textInputAction: TextInputAction.next,
                    decoration: const InputDecoration(
                      labelText: "Course name",
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: controller.courseDescriptionCtrl,
                    textInputAction: TextInputAction.next,
                    decoration: const InputDecoration(
                      labelText: "Course description",
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10),
                  DropdownButtonFormField(
                    hint: const Text("Course medium"),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your gender.';
                      }
                      return null;
                    },
                    items:
                        ["english", "tamil", "sinhala"].map((String category) {
                      return DropdownMenuItem(
                          value: category,
                          child: Row(
                            children: <Widget>[
                              Text(category),
                            ],
                          ));
                    }).toList(),
                    onChanged: (newValue) {
                      controller.mediumVal.value = newValue;
                    },
                    value: controller.mediumVal.value,
                    decoration: inputDecoration,
                  ),
                  const SizedBox(height: 10),
                  DropdownButtonFormField(
                    hint: const Text("Course charge"),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your gender.';
                      }
                      return null;
                    },
                    items: ["free", "paid"].map((String category) {
                      return DropdownMenuItem(
                          value: category,
                          child: Row(
                            children: <Widget>[
                              Text(category),
                            ],
                          ));
                    }).toList(),
                    onChanged: (newValue) {
                      controller.chargeVal.value = newValue;
                    },
                    value: controller.chargeVal.value,
                    decoration: inputDecoration,
                  ),
                  const SizedBox(height: 10),
                  DropdownButtonFormField(
                    hint: const Text("Subscription mode"),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your gender.';
                      }
                      return null;
                    },
                    items: [
                      "lifetime-access",
                      "6-months",
                      "12-months",
                      "24-months"
                    ].map((String category) {
                      return DropdownMenuItem(
                          value: category,
                          child: Row(
                            children: <Widget>[
                              Text(category),
                            ],
                          ));
                    }).toList(),
                    onChanged: (newValue) {
                      controller.subscriptionVal.value = newValue;
                    },
                    value: controller.subscriptionVal.value,
                    decoration: inputDecoration,
                  ),
                  const SizedBox(height: 14),
                ],
              ),
              SizedBox(
                width: Get.width * 0.75,
                child: ElevatedButton(
                  onPressed: () {
                    if (controller.getFormKey.currentState!.validate()) {
                      Get.to(() => AddCourseFinalView());
                    }
                    // Get.to(() => AddCourseFinalView());
                  },
                  child: const Text("Next"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
