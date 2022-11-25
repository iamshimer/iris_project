import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/add_course_controller.dart';

class AddObjective extends StatelessWidget {
  const AddObjective({super.key, required this.acc});
  final AddCourseController acc;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        // color: Colors.amber,
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
                  const Center(
                    child: Text(
                      "Your course objectives",
                      textScaleFactor: 1.6,
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(13.0),
                      child: Obx(
                        () => acc.getCourseObjectives.isNotEmpty
                            ? ListView.builder(
                                reverse: true,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      // ignore: prefer_const_literals_to_create_immutables
                                      children: [
                                        Expanded(
                                          child: Text(
                                            " ${index + 1}.  ${acc.getCourseObjectives[index]}",
                                            textScaleFactor: 1.2,
                                          ),
                                        ),
                                        IconButton(
                                          onPressed: () {
                                            acc.getCourseObjectives
                                                .removeAt(index);
                                          },
                                          icon: const Icon(Icons.delete),
                                        )
                                      ],
                                    ),
                                  );
                                },
                                itemCount: acc.getCourseObjectives.length,
                              )
                            : const Center(
                                child: Text(
                                  "You have no course objectives yet",
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
                  onPressed: acc.getCourseObjectives.length > 14
                      ? null
                      : () async {
                          final res = await _displayDialog(context);
                          if (res == null || res.isEmpty) return;
                          acc.setCourseObjectives = res;
                          acc.alertDialogObjCtrl.clear();
                        },
                  child: const Text("Add objective"),
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
            title: const Text('Add an objective'),
            titlePadding: const EdgeInsets.all(18),
            contentPadding: const EdgeInsets.all(28),
            actions: [
              TextButton(
                  onPressed: () {
                    Get.back(result: acc.alertDialogObjCtrl.text);
                  },
                  child: const Text("Submit"))
            ],
            actionsPadding: const EdgeInsets.all(10),
            content: TextField(
              controller: acc.alertDialogObjCtrl,
              decoration: const InputDecoration(hintText: "Text goes here.."),
            ),
          );
        });
  }
}
