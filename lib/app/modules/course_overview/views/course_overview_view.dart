// ignore_for_file: prefer_const_constructors

import 'package:faker/faker.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../services/auth_services.dart';
import '../../../utils/theme_service.dart';
import '../../common_interface/controllers/common_interface_controller.dart';
import '../controllers/course_overview_controller.dart';

class CourseOverviewView extends GetView<CourseOverviewController> {
  final CommonInterfaceController cic = Get.find();
  final paragraphT =
      "Reprehenderit ipsum ipsum anim laboris commodo ex adipisicing veniam. Exercitation aliqua velit aliquip ad consectetur. Pariatur nisi incididunt esse ipsum est.";
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
                        children: const [
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
                            'MyCoursesView is working',
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
                            paragraphT,
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
                        children: const [
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
                            "2022.03.12",
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
                            "English",
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
                            "Course fee:",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "20\$",
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
                            "lifetime access",
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
                          // CourseObjectivesList(paragraphT: paragraphT),
                          CourseObjectivesList(
                            paragraphT: Faker().lorem.sentence(),
                          ),
                          CourseObjectivesList(
                            paragraphT: Faker().lorem.sentence(),
                          ),
                          CourseObjectivesList(
                            paragraphT: Faker().lorem.sentence(),
                          ),
                          CourseObjectivesList(
                            paragraphT: Faker().lorem.sentence(),
                          ),
                          CourseObjectivesList(
                            paragraphT: Faker().lorem.sentence(),
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
                          CourseObjectivesList(
                            paragraphT: Faker().lorem.sentence(),
                          ),
                          CourseObjectivesList(
                            paragraphT: Faker().lorem.sentence(),
                          ),
                          CourseObjectivesList(
                            paragraphT: Faker().lorem.sentence(),
                          ),
                          CourseObjectivesList(
                            paragraphT: Faker().lorem.sentence(),
                          ),
                          CourseObjectivesList(
                            paragraphT: Faker().lorem.sentence(),
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
                    style:
                        ElevatedButton.styleFrom(shape: const StadiumBorder()),
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
    );
  }
}

class CourseObjectivesList extends StatelessWidget {
  const CourseObjectivesList({
    Key? key,
    required this.paragraphT,
  }) : super(key: key);

  final String paragraphT;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      // ignore: prefer_const_literals_to_create_immutables
      children: [
        Text(
          '\u2022',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
        SizedBox(width: 5),
        Expanded(
            child: Text(
          paragraphT,
          style: TextStyle(
            color: Colors.white,
          ),
        ))
      ],
    );
  }
}
