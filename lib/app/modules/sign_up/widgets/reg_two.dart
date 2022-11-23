// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../controllers/sign_up_controller.dart';

class RegTwo extends GetView<SignUpController> {
  const RegTwo({super.key});

  @override
  Widget build(BuildContext context) {
    var sizedBox = SizedBox(
      height: 30,
    );
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Form(
        key: controller.formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            Text(
              "Your name",
              textScaleFactor: 2,
            ),
            TextFormField(
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
            Text(
              "Age",
              textScaleFactor: 2,
            ),
            TextFormField(
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
            Text(
              "Gender",
              textScaleFactor: 2,
            ),
            DropdownButtonFormField(
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
              decoration: InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(10, 20, 10, 20),
                filled: true,
                fillColor: Colors.grey[200],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
