// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum StatusValues { success, fail }

showFeedbackStatus(String errMsg, StatusValues stVal, {dynamic code = 999}) {
  if (Get.isSnackbarOpen) {
    Get.closeCurrentSnackbar();
  }

  var textStyle = TextStyle(
    color: Colors.white,
  );
  Get.snackbar(
    stVal == StatusValues.success ? "Success" : "Failed",
    errMsg,
    messageText: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // if (stVal != StatusValues.success) ...[
        Text(
          errMsg,
          style: textStyle,
        ),
        // ],
        SizedBox(
          height: 4,
        ),
        if (code != 999) ...[
          Text(
            "code: $code ",
            style: textStyle,
          )
        ]
      ],
    ),
    animationDuration: Duration(milliseconds: 200),
    colorText: Colors.white,
    duration: Duration(milliseconds: 3000),
    snackPosition: SnackPosition.BOTTOM,
    icon: stVal == StatusValues.success
        ? const Icon(
            Icons.check_circle,
            size: 40,
            color: Colors.white,
          )
        : const Icon(
            Icons.error,
            size: 40,
            color: Colors.white,
          ),
    shouldIconPulse: false,
    margin: EdgeInsets.zero,
    borderRadius: 0,
    backgroundColor: stVal == StatusValues.success ? Colors.green : Colors.red,
    isDismissible: true,
  );
}
