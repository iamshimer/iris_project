import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/sign_up_controller.dart';

class RegOne extends GetView<SignUpController> {
  const RegOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 350,
            width: Get.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 40,
                  width: Get.width * 0.25,
                  decoration: const BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(35),
                        bottomRight: Radius.circular(35),
                      )),
                  child: const Center(
                      child: Text(
                    "1 of 3",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                    textScaleFactor: 1.5,
                  )),
                ),
                Expanded(
                  child: SizedBox(
                    width: Get.width,
                    child: Center(
                      child: Image.asset(
                        "assets/images/pOne.png",
                        width: Get.width * 0.5,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "How would you like to register?",
                    textScaleFactor: 2.2,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Flexible(
                  child: CustomRadioButton(
                    margin: const EdgeInsets.all(8),
                    customShape: RoundedRectangleBorder(
                      side: const BorderSide(width: 2, color: Colors.amber),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    shapeRadius: 10,
                    buttonTextStyle: const ButtonTextStyle(
                        textStyle: TextStyle(
                      fontSize: 19,
                      letterSpacing: 2,
                    )),
                    elevation: 5,
                    enableShape: true,
                    height: 70,
                    selectedBorderColor: Colors.transparent,
                    unSelectedBorderColor: Colors.transparent,
                    autoWidth: true,
                    horizontal: true,
                    selectedColor: Colors.amber,
                    unSelectedColor: Theme.of(context).canvasColor,
                    defaultSelected: controller.getRoleVal,
                    // ignore: prefer_const_literals_to_create_immutables
                    buttonLables: [
                      'Tutor',
                      'Student',
                    ],
                    // ignore: prefer_const_literals_to_create_immutables
                    buttonValues: [
                      'tutor',
                      'student',
                    ],

                    radioButtonValue: (value) {
                      controller.setRoleVal = value;
                    },
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
