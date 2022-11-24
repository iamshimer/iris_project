// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/joined_courses_controller.dart';

class JoinedCoursesView extends GetView<JoinedCoursesController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'JoinedCoursesView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
