import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:iris_project/app/routes/app_pages.dart';

import '../../common_interface/controllers/common_interface_controller.dart';
import '../controllers/my_courses_controller.dart';

class MyCoursesView extends GetView<MyCoursesController> {
  final CommonInterfaceController cic = Get.find();

  MyCoursesView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  Get.toNamed(Routes.ADD_COURSE);
                },
                child: Container(
                  width: Get.width,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.cyan,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Icon(
                    Icons.add,
                    size: 30,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Expanded(
                  child: Obx(
                () => ListView.separated(
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 15,
                  ),
                  itemBuilder: (context, index) {
                    return Container(
                      width: Get.width,
                      padding: const EdgeInsets.only(top: 6),
                      height: 110,
                      decoration: BoxDecoration(
                        color: Colors.cyan,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: ListTile(
                        onTap: () {
                          Get.toNamed(Routes.ADMIN_COURSE_OVERVIEW,
                              arguments: cic.getUserAdditional!
                                  .myCourses![index].courseDocId);
                        },
                        title: SizedBox(
                          height: 51,
                          child: Text(
                            cic.getUserAdditional!.myCourses![index].courseName,
                            textScaleFactor: 1.3,
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              letterSpacing: 2,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        subtitle: Text(
                          "Created at: ${DateTime.fromMillisecondsSinceEpoch(cic.getUserAdditional!.myCourses![index].createdAt)} ",
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            letterSpacing: 2,
                            color: Colors.white,
                          ),
                        ),
                        trailing: const Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.white,
                        ),
                      ),
                    );
                  },
                  itemCount: cic.getUserAdditional!.myCourses!.length,
                ),
              )),
            ],
          ),
        ),
      ),
    );
  }
}
