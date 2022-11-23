// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/my_courses_controller.dart';

class MyCoursesView extends GetView<MyCoursesController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'MyCoursesView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
