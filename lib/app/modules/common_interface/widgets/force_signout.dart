import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/common_interface_controller.dart';

forceSignOut() async {
  Get.defaultDialog(
    barrierDismissible: false,
    titlePadding: const EdgeInsets.all(25),
    title: "Something went wrong...!",
    content: const Text(
        "There was something went wrong while fetching data. Please report this issue to admimistrator.Report button canbe found at login page "),
    confirm: GestureDetector(
      onTap: () async {
        final CommonInterfaceController cic = Get.find();
        await cic.signMeOut();
        Get.back();
      },
      child: Container(
        width: double.infinity,
        height: 35,
        decoration: const BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: const Center(
            child: Text(
          "Signout now",
          style: TextStyle(
            color: Colors.white,
          ),
        )),
      ),
    ),
  );
}
