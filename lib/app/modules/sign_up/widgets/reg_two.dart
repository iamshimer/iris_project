import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../common_widgets/common_input.borders.dart';
import '../controllers/sign_up_controller.dart';

class RegTwo extends GetView<SignUpController> {
  const RegTwo({super.key});

  @override
  Widget build(BuildContext context) {
    var sizedBox = const SizedBox(
      height: 30,
    );
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: Get.width,
            height: 350,
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
                    "2 of 3",
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
                        "assets/images/pTwo.png",
                        width: Get.width * 0.5,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Expanded(
            child: Form(
              key: controller.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.only(
                        left: 15,
                        right: 15,
                        top: 20,
                        bottom: 20,
                      ),
                      enabledBorder: outlineInputBorder,
                      focusedBorder: outlineInputBorder,
                      errorBorder: outlineInputBorder2,
                      focusedErrorBorder: outlineInputBorder2,
                      label: const Text("Name"),
                    ),
                    controller: controller.nameCtrl,
                    textCapitalization: TextCapitalization.words,
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.next,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your name.';
                      }
                      return null;
                    },
                  ),
                  sizedBox,
                  TextFormField(
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.only(
                        left: 15,
                        right: 15,
                        top: 20,
                        bottom: 20,
                      ),
                      enabledBorder: outlineInputBorder,
                      focusedBorder: outlineInputBorder,
                      errorBorder: outlineInputBorder2,
                      focusedErrorBorder: outlineInputBorder2,
                      label: const Text("Age"),
                    ),
                    controller: controller.ageCtrl,
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                    ],
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your age.';
                      }
                      return null;
                    },
                  ),
                  sizedBox,
                  DropdownButtonFormField(
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.only(
                        left: 15,
                        right: 15,
                        top: 20,
                        bottom: 20,
                      ),
                      enabledBorder: outlineInputBorder,
                      focusedBorder: outlineInputBorder,
                      errorBorder: outlineInputBorder2,
                      focusedErrorBorder: outlineInputBorder2,
                      label: const Text("Gender"),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your gender.';
                      }
                      return null;
                    },
                    items: ["male", "female"].map((String category) {
                      return DropdownMenuItem(
                          value: category,
                          child: Row(
                            children: <Widget>[
                              Text(category),
                            ],
                          ));
                    }).toList(),
                    onChanged: (newValue) {
                      controller.setGenderValue = newValue;
                    },
                    value: controller.genderValue.value,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
