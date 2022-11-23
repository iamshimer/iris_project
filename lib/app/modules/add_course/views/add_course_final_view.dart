// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:iris_project/app/common_widgets/common_app_bar.dart';
import 'package:iris_project/app/modules/common_interface/controllers/common_interface_controller.dart';

import '../controllers/add_course_controller.dart';

class AddCourseFinalView extends GetView<AddCourseController> {
  final CommonInterfaceController _cic = Get.find();
  @override
  Widget build(BuildContext context) {
    var expanded = Container(
      height: 300,
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (controller.getCourseObjectives.isNotEmpty) ...[
                  Text(
                    "Course Objectives",
                    textScaleFactor: 1.7,
                  ),
                  SizedBox(
                    height: 20,
                  )
                ],
                // Expanded(
                //   child: Padding(
                //     padding: const EdgeInsets.all(16),
                //     child: ListView(
                //       children: [
                //         for (int i = 0;
                //             i < controller.getCourseObjectives.length;
                //             i++)
                //           MyNewList(
                //               paragraphT: controller.getCourseObjectives[i],
                //               acc: controller,
                //               idx: i),
                //       ],
                //     ),
                //   ),
                // ),

                Flexible(
                  child: Obx(() => controller.getCourseObjectives.isNotEmpty
                      ? ListView.builder(
                          itemBuilder: (context, idx) {
                            return MyNewList(
                                paragraphT: controller.getCourseObjectives[idx],
                                acc: controller,
                                idx: idx);
                          },
                          itemCount: controller.getCourseObjectives.length,
                        )
                      : Center(
                          child: Text(
                          "No course objectives found here",
                          textScaleFactor: 2,
                        ))),
                ),
              ],
            ),
          ),
          Container(
            // color: Colors.green,
            child: Center(
              child: TextButton.icon(
                onPressed: () async {
                  final res = await _displayTextInputDialog(context);
                  if (res == null || res.isEmpty) return;
                  controller.setCourseObjectives = res;
                  controller.alertDialogCtlr.clear();
                },
                icon: Icon(Icons.add),
                label: Text("Add course objectives"),
              ),
            ),
          ),
        ],
      ),
    );
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: returnAppBar(_cic, "Add course final"),
      body: Column(
        children: [
          Expanded(
            child: Column(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                expanded,
              ],
            ),
          ),
          ElevatedButton(onPressed: () {}, child: Text("Finish"))
        ],
      ),
    );
  }

  Future<String?> _displayTextInputDialog(BuildContext context) async {
    return showDialog<String>(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Add an objective'),
            titlePadding: EdgeInsets.all(18),
            contentPadding: EdgeInsets.all(28),
            actions: [
              TextButton(
                  onPressed: () {
                    Get.back(result: controller.alertDialogCtlr.text);
                  },
                  child: Text("Submit"))
            ],
            actionsPadding: EdgeInsets.all(10),
            content: TextField(
              controller: controller.alertDialogCtlr,
              decoration: InputDecoration(hintText: "Text Field in Dialog"),
            ),
          );
        });
  }
}

class MyNewList extends StatelessWidget {
  const MyNewList({
    Key? key,
    required this.paragraphT,
    required this.acc,
    required this.idx,
  }) : super(key: key);

  final String paragraphT;
  final AddCourseController acc;
  final int idx;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              Text(
                '\u2022',
                textScaleFactor: 1.1,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
              SizedBox(width: 5),
              Expanded(
                  child: Text(
                paragraphT,
                textScaleFactor: 1.1,
                style: TextStyle(
                  color: Colors.black,
                ),
              ))
            ],
          ),
        ),
        IconButton(
          onPressed: () {
            acc.getCourseObjectives.removeAt(idx);
          },
          icon: Icon(Icons.delete),
        )
      ],
    );
  }
}
