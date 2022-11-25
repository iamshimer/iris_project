import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:iris_project/app/modules/common_interface/controllers/common_interface_controller.dart';

import '../../home/controllers/home_controller.dart';
import '../controllers/profile_controller.dart';

// ignore: must_be_immutable
class ProfileView extends GetView<ProfileController> {
  final hc = Get.put(HomeController());
  CommonInterfaceController cic = Get.find();

  ProfileView({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: Get.height * 0.35,
                  width: Get.width,
                  child: Stack(
                    children: [
                      SizedBox(
                        width: Get.width,
                        height: Get.height * 0.26,
                        child: Image.asset(
                          "assets/images/coverPic.jpg",
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        child: Container(
                          alignment: Alignment.topCenter,
                          color: Colors.transparent,
                          width: Get.width,
                          height: Get.height * 0.18,
                          child: CircleAvatar(
                            radius: 71,
                            backgroundColor: Colors.white,
                            child: CircleAvatar(
                              radius: 68,
                              backgroundColor: Colors.transparent,
                              child: ClipOval(
                                  child: Image.asset(
                                      "assets/images/profilePic.jpg")),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      _renderFields("Name", cic.getUserAdditional?.name ?? ""),
                      _renderFields(
                          "Age", cic.getUserAdditional?.age.toString() ?? ""),
                      _renderFields("Role", cic.getUserAdditional!.role),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: SizedBox(
                  width: Get.width * 0.75,
                  height: 45,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      shape: const StadiumBorder(),
                      backgroundColor: Colors.red,
                    ),
                    child: const Text(
                      "Delete account",
                      textScaleFactor: 1.2,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Column _renderFields(String labelName, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelName,
          style: const TextStyle(color: Colors.grey),
          textScaleFactor: 1.45,
        ),
        const SizedBox(
          height: 6,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              value,
              textScaleFactor: 1.6,
            ),
            if (labelName != "Role") ...[
              GestureDetector(
                onTap: () {},
                child: const Icon(
                  Icons.edit,
                ),
              )
            ],
          ],
        ),
        const Divider(),
        const SizedBox(
          height: 20,
        )
      ],
    );
  }
}
