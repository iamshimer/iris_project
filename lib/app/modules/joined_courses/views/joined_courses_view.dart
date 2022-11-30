import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:iris_project/app/common_widgets/custom_snackbar.dart';
import 'package:iris_project/app/modules/common_interface/controllers/common_interface_controller.dart';

import '../controllers/joined_courses_controller.dart';

class JoinedCoursesView extends GetView<JoinedCoursesController> {
  JoinedCoursesView({super.key});
  final CommonInterfaceController _cic = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemBuilder: (context, idx) {
          return Container(
            margin: const EdgeInsets.all(8),
            padding: const EdgeInsets.all(4),
            height: 115,
            child: ListTile(
              onTap: () {
                showFeedbackStatus(
                    "Goto access class modules", StatusValues.success);
              },
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              tileColor: Colors.cyan,
              title: SizedBox(
                height: 70,
                child: Text(
                  _cic.getUserAdditional!.joinedCourses![idx].courseName,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  textScaleFactor: 1.30,
                ),
              ),
              subtitle: Text(
                "Joined: ${DateTime.fromMillisecondsSinceEpoch(_cic.getUserAdditional!.joinedCourses![idx].joinedAt).toString()}",
                style: const TextStyle(
                  color: Colors.white,
                ),
                textScaleFactor: 1.2,
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                color: Colors.white,
              ),
            ),
          );
        },
        itemCount: _cic.getUserAdditional?.joinedCourses?.length,
      ),
    );
  }
}
