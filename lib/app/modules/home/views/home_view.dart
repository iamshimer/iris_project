// ignore_for_file: prefer_const_constructors

import 'dart:math' as math show Random;

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:iris_project/app/modules/common_interface/controllers/common_interface_controller.dart';
import 'package:iris_project/app/routes/app_pages.dart';
// import 'package:iris_project/app/utils/theme_service.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  final CommonInterfaceController cic = Get.find();
  PageController pageController =
      PageController(viewportFraction: 0.85, initialPage: 0);
  final hc = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
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
              SizedBox(
                height: 170,
                child: PageView.builder(
                  itemBuilder: (ctx, currentIdx) {
                    return GestureDetector(
                      onTap: () {
                        print("tapped");
                        Get.toNamed(Routes.COURSE_OVERVIEW);
                      },
                      child: Container(
                        margin: EdgeInsets.all(5),
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.primaries[math.Random()
                              .nextInt(Colors.primaries.length)][500],
                          borderRadius: BorderRadius.circular(11),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "This is course title of all the items",
                              style: TextStyle(
                                fontSize: 30,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 50,
                              child: Text(
                                "Category: Information and communication technology" *
                                    10,
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                  itemCount: 10,
                  controller: pageController,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Announcements",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                  textScaleFactor: 2.4,
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(178, 235, 242, 0.3),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListView(
                      children: [
                        _renderData(18),
                        _renderData(5),
                        _renderData(7),
                        _renderData(8),
                        _renderData(6),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  _renderData(int i) {
    return Container(
        padding: EdgeInsets.all(3),
        margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        decoration: BoxDecoration(
            color: Colors.cyan,
            borderRadius: BorderRadius.all(
              Radius.circular(12),
            )),
        height: 113,
        child: ListTile(
          onTap: () => Get.toNamed(Routes.ANNOUNCEMENT),
          title: SizedBox(
            height: 59,
            child: Text(
              "Chk announcement now" * i,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              textScaleFactor: 1.5,
            ),
          ),
          subtitle: Container(
            padding: EdgeInsets.only(bottom: 5),
            height: 50,
            child: Text(
              "Attached course: MYF course ",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          trailing: Icon(
            Icons.arrow_forward_ios,
            color: Colors.white,
          ),
        ));
  }
}
