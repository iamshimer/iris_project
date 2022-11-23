// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:iris_project/app/routes/app_pages.dart';

import '../../../services/auth_services.dart';
import '../../../utils/theme_service.dart';
import '../../common_interface/controllers/common_interface_controller.dart';
import '../controllers/my_courses_controller.dart';

class MyCoursesView extends GetView<MyCoursesController> {
  final CommonInterfaceController cic = Get.find();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              GestureDetector(
                onTap: () {
                  print("add");
                  Get.toNamed(Routes.ADD_COURSE);
                },
                child: Container(
                  width: Get.width,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.cyan,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Icon(
                    Icons.add,
                    size: 30,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                width: Get.width,
                height: 90,
                decoration: BoxDecoration(
                  color: Colors.cyan,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: ListTile(
                  onTap: () {
                    print("object");
                    Get.toNamed(Routes.COURSE_OVERVIEW);
                  },
                  title: Text(
                    "Course one",
                    textScaleFactor: 1.3,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      letterSpacing: 2,
                      color: Colors.white,
                    ),
                  ),
                  subtitle: Text(
                    "course sub",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      letterSpacing: 2,
                      color: Colors.white,
                    ),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white,
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
