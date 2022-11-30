import 'dart:math' as math show Random;

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:iris_project/app/common_widgets/custom_snackbar.dart';
import 'package:iris_project/app/modules/common_interface/controllers/common_interface_controller.dart';
import 'package:iris_project/app/modules/home/widgets/announcement_tile_replacement.dart';
import 'package:iris_project/app/modules/home/widgets/page_view_replacement.dart';
import 'package:iris_project/app/routes/app_pages.dart';

import '../controllers/home_controller.dart';
import '../models/announcement_model.dart';

class HomeView extends StatelessWidget {
  final CommonInterfaceController cic = Get.find();

  final controller = Get.put(HomeController());

  HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    var sizedBox = SizedBox(
      height: 170,
      child: Obx(
        () => controller.getPrimaryData.isNotEmpty
            ? PageView.builder(
                itemBuilder: (ctx, currentIdx) {
                  return GestureDetector(
                    onTap: () {
                      if (cic.isTutor) {
                        showFeedbackStatus("tutors cannot enroll in courses",
                            StatusValues.fail);
                        return;
                      }
                      Get.toNamed(Routes.COURSE_OVERVIEW,
                          arguments: controller.getPrimaryData[currentIdx]);
                    },
                    child: Container(
                      margin: const EdgeInsets.all(5),
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.primaries[math.Random()
                            .nextInt(Colors.primaries.length)][500],
                        borderRadius: BorderRadius.circular(11),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 70,
                            child: Text(
                              controller.getPrimaryData[currentIdx].courseName,
                              style: const TextStyle(
                                fontSize: 30,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 50,
                            child: Text(
                              controller
                                  .getPrimaryData[currentIdx].courseDescription,
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
                itemCount: controller.getPrimaryData.length,
                controller: controller.pageController,
              )
            : const PageViewSkeleton(),
      ),
    );
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "New Courses for you",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                  textScaleFactor: 2.4,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8, bottom: 8),
                child: Text(
                  "Join to get full benifits",
                  style: TextStyle(color: Colors.grey[600]),
                  textScaleFactor: 1,
                ),
              ),
              sizedBox,
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Announcements",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                  textScaleFactor: 2.4,
                ),
              ),
              Obx(() => Expanded(
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Color.fromRGBO(178, 235, 242, 0.3),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(12),
                          topRight: Radius.circular(12),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: controller.getSecondaryData.isEmpty
                            ? const AnnounceReplace()
                            : ListView.builder(
                                itemBuilder: (context, index) => _renderData(
                                    controller.getSecondaryData[index]),
                                itemCount: controller.getSecondaryData.length,
                              ),
                      ),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }

  _renderData(AnnouncementModel am) {
    return Container(
      padding: const EdgeInsets.all(3),
      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      decoration: const BoxDecoration(
          color: Colors.cyan,
          borderRadius: BorderRadius.all(
            Radius.circular(12),
          )),
      height: 113,
      child: ListTile(
        onTap: () => Get.toNamed(Routes.ANNOUNCEMENT, arguments: am),
        title: SizedBox(
          height: 59,
          child: Text(
            am.title,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            textScaleFactor: 1.5,
          ),
        ),
        subtitle: Container(
          padding: const EdgeInsets.only(bottom: 5),
          height: 50,
          child: const Text(
            "Attached course: MYF course ",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        trailing: const Icon(
          Icons.arrow_forward_ios,
          color: Colors.white,
        ),
      ),
    );
  }
}
