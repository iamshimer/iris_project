// ignore_for_file: avoid_print

import 'package:cloud_functions/cloud_functions.dart';
import 'package:iris_project/app/common_widgets/custom_snackbar.dart';
import 'package:iris_project/app/services/auth_services.dart';

class CloudService {
  static Future callCloudFun(Map<String, dynamic> incMap) async {
    final functions = FirebaseFunctions.instance;

    try {
      final result =
          await functions.httpsCallable('requestUserCreation').call(incMap);

      if (result.data["status"] == "error") {
        showFeedbackStatus(
            "something went wrong. Try again later", StatusValues.fail,
            code: result.data["payload"]["code"]);
      } else {
        showFeedbackStatus("User created successfully", StatusValues.success);
        await AuthServices().loginUser(incMap["email"], incMap["password"]);
      }
      return result.data;
    } on FirebaseFunctionsException catch (error) {
      showFeedbackStatus(
          "something went wrong. Try again later", StatusValues.fail,
          code: error.code);
    } catch (err) {
      showFeedbackStatus(
        "something went wrong. Try again later",
        StatusValues.fail,
      );
    }
  }
}
