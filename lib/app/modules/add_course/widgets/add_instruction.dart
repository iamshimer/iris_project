// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/add_course_controller.dart';

class AddInstruction extends StatelessWidget {
  const AddInstruction({super.key, required this.acc});
  final AddCourseController acc;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        // color: Colors.red,
        height: 200,
        width: Get.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            Expanded(
              child: Column(
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Center(
                    child: Text(
                      "Your course instructions",
                      textScaleFactor: 1.6,
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(13.0),
                      child: Obx(
                        () => acc.getStudentInstructions.isNotEmpty
                            ? ListView.builder(
                                reverse: true,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      // ignore: prefer_const_literals_to_create_immutables
                                      children: [
                                        Expanded(
                                          child: Text(
                                            " ${index + 1}.  ${acc.getStudentInstructions[index]}",
                                            textScaleFactor: 1.2,
                                          ),
                                        ),
                                        IconButton(
                                          onPressed: () {
                                            acc.getStudentInstructions
                                                .removeAt(index);
                                          },
                                          icon: Icon(Icons.delete),
                                        )
                                      ],
                                    ),
                                  );
                                },
                                itemCount: acc.getStudentInstructions.length,
                              )
                            : Center(
                                child: Text(
                                  "You have no course instructions yet",
                                  textScaleFactor: 2,
                                ),
                              ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Obx(() => ElevatedButton(
                  onPressed: acc.getStudentInstructions.length > 14
                      ? null
                      : () async {
                          final res = await _displayDialog(context);
                          if (res == null || res.isEmpty) return;
                          acc.setStudentInstructions = res;
                          acc.alertDialogInstCtrl.clear();
                        },
                  child: Text("Add instruction"),
                )),
          ],
        ),
      ),
    );
  }

  Future<String?> _displayDialog(BuildContext context) async {
    return showDialog<String>(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Add an instruction'),
            titlePadding: EdgeInsets.all(18),
            contentPadding: EdgeInsets.all(28),
            actions: [
              TextButton(
                  onPressed: () {
                    Get.back(result: acc.alertDialogInstCtrl.text);
                  },
                  child: Text("Submit"))
            ],
            actionsPadding: EdgeInsets.all(10),
            content: TextField(
              controller: acc.alertDialogInstCtrl,
              decoration: InputDecoration(hintText: "Text goes here.."),
            ),
          );
        });
  }
}
