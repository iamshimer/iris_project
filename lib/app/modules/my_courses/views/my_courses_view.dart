// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'package:get/get.dart';

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
        appBar: AppBar(
          centerTitle: true,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(16),
              // top: Radius.circular(10),
            ),
          ),
          title: Text("Course overview"),
          actions: <Widget>[
            IconButton(
                onPressed: () {
                  ThemeService().switchTheme();
                },
                icon: const Icon(Icons.dark_mode)),
            PopupMenuButton<String>(
              position: PopupMenuPosition.under,
              tooltip: "Options",
              onSelected: (dsdsd) {
                cic.setUserAddiVal = null;
                cic.setUser = null;
                AuthServices().logOut();
              },
              itemBuilder: (BuildContext context) {
                return {'Logout'}.map((String choice) {
                  return PopupMenuItem<String>(
                    value: choice,
                    child: Text(choice),
                  );
                }).toList();
              },
            ),
          ],
        ),
        body: Center(
          child: Text(
            'MyCoursesView is working',
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}
