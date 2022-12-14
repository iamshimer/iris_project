import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:iris_project/app/common_widgets/loading_overlay.dart';

import '../../../common_widgets/common_input.borders.dart';
import '../controllers/add_announcement_controller.dart';

class AddAnnouncementView extends GetView<AddAnnouncementController> {
  AddAnnouncementView({super.key});
  final hc = Get.put(AddAnnouncementController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Form(
            key: controller.getFormKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      textCapitalization: TextCapitalization.words,
                      controller: controller.titleCtrl,
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
                        hintText: "Announcement title",
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter title';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10),
                    Obx(() => DropdownButtonFormField(
                          hint: const Text("Associated course name"),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please select course code.';
                            }
                            return null;
                          },
                          items:
                              controller.dropdownList!.map((String category) {
                            return DropdownMenuItem(
                                value: category,
                                child: SizedBox(
                                    width: Get.width * 0.76,
                                    child: Text(category)));
                          }).toList(),
                          onChanged: (newValue) {
                            controller.courseValue.value = newValue;
                          },
                          value: controller.courseValue.value,
                          decoration: InputDecoration(
                            helperText: "check your course name before select",
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
                            hintText: "Announcement message",
                          ),
                        )),
                    const SizedBox(height: 10),
                    TextFormField(
                      textCapitalization: TextCapitalization.sentences,
                      maxLength: 750,
                      maxLines: 5,
                      controller: controller.messageCtrl,
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
                        hintText: "Announcement message",
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter the message';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
                SizedBox(
                  width: Get.width * 0.75,
                  child: ElevatedButton(
                    onPressed: () async {
                      if (controller.getFormKey.currentState!.validate()) {
                        FocusScopeNode currentFocus = FocusScope.of(context);
                        if (!currentFocus.hasPrimaryFocus) {
                          currentFocus.unfocus();
                        }
                        await Get.showOverlay(
                          asyncFunction: () => controller.prepareData(),
                          loadingWidget: const LoadingOverlay(isOverlay: true),
                        );
                        hc.titleCtrl.clear();
                        hc.messageCtrl.clear();
                        hc.courseValue.value = null;
                      }
                    },
                    child: const Text("Submit"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
