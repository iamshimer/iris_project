import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:iris_project/app/common_widgets/common_app_bar.dart';
import 'package:iris_project/app/common_widgets/loading_overlay.dart';
import 'package:iris_project/app/modules/joined_courses/models/joined_course_model.dart';
import 'package:iris_project/app/services/database_services.dart';

import '../../../common_widgets/row_list.dart';
import '../../common_interface/controllers/common_interface_controller.dart';
import '../controllers/course_overview_controller.dart';

class CourseOverviewView extends GetView<CourseOverviewController> {
  final CommonInterfaceController cic = Get.find();

  CourseOverviewView({super.key});
  @override
  Widget build(BuildContext context) {
    var boxDecoration = const BoxDecoration(
      color: Color.fromARGB(255, 8, 2, 79),
      borderRadius: BorderRadius.all(
        Radius.circular(15),
      ),
    );
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blue.shade50,
        appBar: returnAppBar(cic, "Course overview"),
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
                      padding: const EdgeInsets.all(15),
                      decoration: boxDecoration,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Course title:",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            controller.getCModule.courseName,
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                            textScaleFactor: 1.5,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: Get.width,
                      padding: const EdgeInsets.all(15),
                      decoration: boxDecoration,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Course description:",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            controller.getCModule.courseName,
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                            textScaleFactor: 1.5,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: Get.width,
                      padding: const EdgeInsets.all(15),
                      decoration: boxDecoration,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Last updated:",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            DateTime.fromMillisecondsSinceEpoch(
                                    controller.getCModule.updatedAt ?? 0)
                                .toString(),
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                            textScaleFactor: 1.5,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            "Medium:",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            controller.getCModule.medium,
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                            textScaleFactor: 1.5,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            "Course payment:",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            controller.getCModule.charge,
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                            textScaleFactor: 1.5,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            "Subscribtion mode:",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            controller.getCModule.subscriptionMode,
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                            textScaleFactor: 1.5,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: Get.width,
                      height: 350,
                      padding: const EdgeInsets.all(15),
                      decoration: boxDecoration,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Course objectives:",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
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
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: Get.width,
                      height: 350,
                      padding: const EdgeInsets.all(15),
                      decoration: boxDecoration,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Student instructions:",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
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
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 7,
              ),
              Center(
                child: SizedBox(
                  width: Get.width * 0.75,
                  height: 45,
                  child: Obx(() {
                    final res =
                        cic.getUserAdditional?.joinedCourses?.firstWhere(
                      (ele) {
                        return ele.courseCode ==
                            controller.getCModule.courseCode;
                      },
                      orElse: () => JoinedCourse(
                        charge: "",
                        courseCode: "",
                        courseName: "",
                        joinedAt: 0,
                        medium: "",
                        ownerEmail: "",
                        ownerUid: "",
                        subscriptionMode: "",
                      ),
                    );

                    return res?.courseCode == ""
                        ? ElevatedButton(
                            onPressed: () {
                              Get.showOverlay(
                                asyncFunction: () async =>
                                    await DatabaseServices().joinTheCourseP1(
                                        controller.getCModule, cic),
                                loadingWidget:
                                    const LoadingOverlay(isOverlay: true),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                                shape: const StadiumBorder()),
                            child: const Text(
                              "Join now",
                              textScaleFactor: 1.2,
                            ),
                          )
                        : ElevatedButton(
                            onPressed: () {
                              Get.showOverlay(
                                asyncFunction: () async =>
                                    await DatabaseServices()
                                        .removeFromCourseOne(
                                            controller.getCModule, cic),
                                loadingWidget:
                                    const LoadingOverlay(isOverlay: true),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                                shape: const StadiumBorder(),
                                backgroundColor: Colors.red),
                            child: const Text(
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
