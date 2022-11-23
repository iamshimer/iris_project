// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:iris_project/app/modules/common_interface/controllers/common_interface_controller.dart';

import '../../../services/auth_services.dart';
import '../../../utils/theme_service.dart';
import '../controllers/announcement_controller.dart';

class AnnouncementView extends GetView<AnnouncementController> {
  final CommonInterfaceController cic = Get.find();

  final paragraphT =
      "Reprehenderit ipsum ipsum anim laboris commodo ex adipisicing veniam. Exercitation aliqua velit aliquip ad consectetur. Pariatur nisi incididunt esse ipsum est.";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(16),
            // top: Radius.circular(10),
          ),
        ),
        title: const Text("Announcement"),
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
        padding: const EdgeInsets.all(12.0),
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.blue[100],
            borderRadius: BorderRadius.circular(12),
          ),
          width: Get.width,
          height: Get.height,
          child: ListView(
            children: [
              Text(
                "Hello!!",
                textScaleFactor: 3,
              ),
              SizedBox(
                height: 5,
              ),
              RichText(
                text: TextSpan(
                  text: 'You have an announcement on ',
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.black,
                  ),
                  children: const <TextSpan>[
                    TextSpan(
                        text: 'Science and Fiction',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 30)),
                    TextSpan(
                      text: ' course module by ',
                    ),
                    TextSpan(
                      text: "Mukulu mama",
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Text(
                "What's this about?",
                textScaleFactor: 1.2,
              ),
              SizedBox(
                height: 5,
              ),
              Text("The title of the beauty Announcement",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
              SizedBox(
                height: 20,
              ),
              Text(
                "Message:",
                textScaleFactor: 1.2,
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                paragraphT * 5,
                textScaleFactor: 1.2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
