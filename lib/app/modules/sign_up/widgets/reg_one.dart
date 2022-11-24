import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/sign_up_controller.dart';

class RegOne extends GetView<SignUpController> {
  const RegOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      // ignore: prefer_const_literals_to_create_immutables
      children: [
        // ignore: prefer_const_constructors
        SizedBox(
          height: 100,
        ),
        // ignore: prefer_const_constructors
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "How would you like to signUP?",
            textScaleFactor: 2.6,
            style: TextStyle(
              fontWeight: FontWeight.bold,
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
              // ignore: avoid_print
              controller.setRoleVal = value;
            },
          ),
        )
      ],
    );
  }
}
