// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:iris_project/app/common_widgets/loading_overlay.dart';
import 'package:iris_project/app/services/database_services.dart';

import '../../../common_widgets/row_list.dart';
import '../../../services/auth_services.dart';
import '../../../utils/theme_service.dart';
import '../../common_interface/controllers/common_interface_controller.dart';
import '../controllers/course_overview_controller.dart';

class CourseOverviewView extends GetView<CourseOverviewController> {
  final CommonInterfaceController cic = Get.find();
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
        body: Padding(
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
                            controller.getCModule.courseName,
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
                            controller.getCModule.courseName,
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
                                    controller.getCModule.updatedAt ?? 0)
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
                            "Medium:",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            controller.getCModule.medium,
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
                            controller.getCModule.charge,
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
                            controller.getCModule.subscriptionMode,
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
                                  paragraphT: controller
                                      .getCModule.courseObjectives[idx],
                                );
                              },
                              itemCount:
                                  controller.getCModule.courseObjectives.length,
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
                                  paragraphT: controller
                                      .getCModule.studentInstructions[idx],
                                );
                              },
                              itemCount: controller
                                  .getCModule.studentInstructions.length,
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
                  child: Obx(() {
                    print("object");
                    print(cic.getUserAdditional?.joinedCourses);
                    final res =
                        cic.getUserAdditional?.joinedCourses?.firstWhere((ele) {
                      return ele["courseCode"] ==
                          controller.getCModule.courseCode;
                    }, orElse: (() => null));

                    print("oop");
                    print(res);

                    return res == null
                        ? ElevatedButton(
                            onPressed: () {
                              Get.showOverlay(
                                asyncFunction: () async =>
                                    await DatabaseServices().joinTheRoomP1(
                                        controller.getCModule, cic),
                                loadingWidget: LoadingOverlay(isOverlay: true),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                                shape: const StadiumBorder()),
                            child: Text(
                              "Join now",
                              textScaleFactor: 1.2,
                            ),
                          )
                        : ElevatedButton(
                            onPressed: () {
                              // Get.showOverlay(
                              //   asyncFunction: () async => await DatabaseServices()
                              //       .joinTheRoomP1(controller.getCModule, cic),
                              //   loadingWidget: LoadingOverlay(isOverlay: true),
                              // );
                              print("leave");
                            },
                            style: ElevatedButton.styleFrom(
                                shape: const StadiumBorder(),
                                backgroundColor: Colors.red),
                            child: Text(
                              "Leave now",
                              textScaleFactor: 1.2,
                            ),
                          );
                  }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
