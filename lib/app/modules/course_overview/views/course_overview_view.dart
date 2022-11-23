import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/course_overview_controller.dart';

class CourseOverviewView extends GetView<CourseOverviewController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CourseOverviewView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'CourseOverviewView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
