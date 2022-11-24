// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:iris_project/app/common_widgets/common_app_bar.dart';
import 'package:iris_project/app/common_widgets/loading_overlay.dart';
import 'package:iris_project/app/modules/common_interface/controllers/common_interface_controller.dart';

import '../../../common_widgets/row_list.dart';
import '../../../routes/app_pages.dart';
import '../../../services/auth_services.dart';
import '../../../utils/theme_service.dart';
import '../controllers/admin_course_overview_controller.dart';

class AdminCourseOverviewView extends GetView<AdminCourseOverviewController> {
  final CommonInterfaceController _cic = Get.find();

  AdminCourseOverviewView({super.key});

  @override
  Widget build(BuildContext context) {
    var boxDecoration = BoxDecoration(
      color: Color.fromARGB(255, 8, 2, 79),
      borderRadius: BorderRadius.all(
        Radius.circular(15),
      ),
    );
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blue.shade50,
        appBar: returnAppBar(_cic, "Course admin OverVw"),
        body: Obx(
          () => controller.isLoading.value
              ? LoadingOverlay(isOverlay: false)
              : Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: ListView(
                          children: [
                            Container(
                              width: Get.width,
                              padding: EdgeInsets.all(15),
                              decoration: boxDecoration,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Course title:",
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    controller.getCM!.courseName,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textScaleFactor: 1.5,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              width: Get.width,
                              padding: EdgeInsets.all(15),
                              decoration: boxDecoration,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Course description:",
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    controller.getCM!.courseName,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textScaleFactor: 1.5,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              width: Get.width,
                              decoration: BoxDecoration(
                                color: Colors.cyan,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: ListTile(
                                onTap: () {
                                  print("object");
                                  Get.toNamed(Routes.SHOW_USER_STATISTICS);
                                },
                                title: Text(
                                  "See the course user joining traffic",
                                  textScaleFactor: 1.3,
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
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              width: Get.width,
                              padding: EdgeInsets.all(15),
                              decoration: boxDecoration,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Last updated:",
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    DateTime.fromMillisecondsSinceEpoch(
                                            controller.getCM!.updatedAt ?? 0)
                                        .toString(),
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textScaleFactor: 1.5,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "Joine user count",
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    controller.getCM!.currentUserCount.toString() ,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textScaleFactor: 1.5,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "Medium:",
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    controller.getCM!.medium,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textScaleFactor: 1.5,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "Course payment:",
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    controller.getCM!.charge,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textScaleFactor: 1.5,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "Subscribtion mode:",
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    controller.getCM!.subscriptionMode,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textScaleFactor: 1.5,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              width: Get.width,
                              height: 350,
                              padding: EdgeInsets.all(15),
                              decoration: boxDecoration,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Course objectives:",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Expanded(
                                    child: ListView.builder(
                                      itemBuilder: (context, idx) {
                                        return CourseObjectivesList(
                                          paragraphT:controller.getCM!.courseObjectives[idx],
                                        );
                                      },
                                      itemCount: controller.getCM!.courseObjectives.length,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              width: Get.width,
                              height: 350,
                              padding: EdgeInsets.all(15),
                              decoration: boxDecoration,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Student instructions:",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Expanded(
                                    child: ListView.builder(
                                      itemBuilder: (context, idx) {
                                        return CourseObjectivesList(
                                          paragraphT: controller.getCM!.studentInstructions[idx],
                                        );
                                      },
                                      itemCount: controller.getCM!.studentInstructions.length,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 7,
                      ),
                      Center(
                        child: SizedBox(
                          width: Get.width * 0.75,
                          height: 45,
                          child: ElevatedButton(
                            onPressed: () {
                              // Get.toNamed(Routes.LOCATE, arguments: controller.hotel);
                            },
                            style: ElevatedButton.styleFrom(
                                shape: const StadiumBorder()),
                            child: Text(
                              "Join now",
                              textScaleFactor: 1.2,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
