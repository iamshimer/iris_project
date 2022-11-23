// ignore_for_file: prefer_const_constructors

import 'package:faker/faker.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:iris_project/app/common_widgets/common_app_bar.dart';
import 'package:iris_project/app/modules/add_course/views/add_course_final_view.dart';
import 'package:iris_project/app/modules/common_interface/controllers/common_interface_controller.dart';

import '../controllers/add_course_controller.dart';

class AddCourseView extends GetView<AddCourseController> {
  final CommonInterfaceController _cic = Get.find();
  @override
  Widget build(BuildContext context) {
    var inputDecoration = InputDecoration(
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
                    decoration: InputDecoration(
                      labelText: "Course name",
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: "Course description",
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 10),
                  DropdownButtonFormField(
                    hint: Text("Course medium"),
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
                      // controller.setGenderValue = newValue;
                      print(newValue);
                    },
                    value: null,
                    decoration: inputDecoration,
                  ),
                  SizedBox(height: 10),
                  DropdownButtonFormField(
                    hint: Text("Course charge"),
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
                      // controller.setGenderValue = newValue;
                      print(newValue);
                    },
                    value: null,
                    decoration: inputDecoration,
                  ),
                  SizedBox(height: 10),
                  DropdownButtonFormField(
                    hint: Text("Subscription mode"),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your gender.';
                      }
                      return null;
                    },
                    items: [
                      "lifetime access",
                      "6 months",
                      "12 months",
                      "24 months"
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
                      // controller.setGenderValue = newValue;
                      print(newValue);
                    },
                    value: null,
                    decoration: inputDecoration,
                  ),
                  SizedBox(height: 14),
                ],
              ),
              SizedBox(
                width: Get.width * 0.75,
                child: ElevatedButton(
                  onPressed: () {
                    // if (controller.getFormKey.currentState!.validate()) {
                    //   Get.to(() => AddCourseFinalView());
                    // }
                    Get.to(() => AddCourseFinalView());
                  },
                  child: Text("Next"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
