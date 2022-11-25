import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:iris_project/app/common_widgets/common_app_bar.dart';
import 'package:iris_project/app/modules/common_interface/controllers/common_interface_controller.dart';

import '../controllers/announcement_controller.dart';

class AnnouncementView extends GetView<AnnouncementController> {
  final CommonInterfaceController cic = Get.find();

  AnnouncementView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: returnAppBar(cic, "Announcement"),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.blue[100],
            borderRadius: BorderRadius.circular(12),
          ),
          width: Get.width,
          height: Get.height,
          child: ListView(
            children: [
              const Text(
                "Hello!!",
                textScaleFactor: 3,
              ),
              const SizedBox(
                height: 5,
              ),
              RichText(
                text: TextSpan(
                  text: 'You have an announcement on ',
                  style: const TextStyle(
                    fontSize: 25,
                    color: Colors.black,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                        text: controller.getModelData.courseName,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 30)),
                    const TextSpan(
                      text: ' course module by ',
                    ),
                    TextSpan(
                      text: controller.getModelData.ownerName,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              const Text(
                "What's this about?",
                textScaleFactor: 1.2,
              ),
              const SizedBox(
                height: 5,
              ),
              Text(controller.getModelData.title,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 30)),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Message:",
                textScaleFactor: 1.2,
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                controller.getModelData.message,
                textScaleFactor: 1.2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
