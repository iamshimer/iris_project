// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../common_widgets/common_input.borders.dart';
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
            TextFormField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(
                  left: 15,
                  right: 15,
                  top: 20,
                  bottom: 20,
                ),
                enabledBorder: outlineInputBorder,
                focusedBorder: outlineInputBorder,
                errorBorder: outlineInputBorder2,
                focusedErrorBorder: outlineInputBorder2,
                hintText: "Your name",
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
                contentPadding: EdgeInsets.only(
                  left: 15,
                  right: 15,
                  top: 20,
                  bottom: 20,
                ),
                enabledBorder: outlineInputBorder,
                focusedBorder: outlineInputBorder,
                errorBorder: outlineInputBorder2,
                focusedErrorBorder: outlineInputBorder2,
                hintText: "Your age",
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
                contentPadding: EdgeInsets.only(
                  left: 15,
                  right: 15,
                  top: 20,
                  bottom: 20,
                ),
                enabledBorder: outlineInputBorder,
                focusedBorder: outlineInputBorder,
                errorBorder: outlineInputBorder2,
                focusedErrorBorder: outlineInputBorder2,
                hintText: "Your gender",
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
    );
  }
}
