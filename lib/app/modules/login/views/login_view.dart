import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:iris_project/app/services/auth_services.dart';

import '../../../common_widgets/rounded_input_borders.dart';
import '../../common_interface/controllers/common_interface_controller.dart';
import '../controllers/login_controller.dart';

class LoginView extends StatelessWidget {
  final CommonInterfaceController cic = Get.find();
  final LoginController lc = Get.put(LoginController());

  LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.only(
                      left: 30,
                      right: 30,
                    ),
                    child: Form(
                        key: lc.formKey,
                        child: Column(
                          children: [
                            const Spacer(
                              flex: 4,
                            ),
                            const Text(
                              "User login",
                              textScaleFactor: 2.5,
                              style: TextStyle(
                                letterSpacing: 4,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Spacer(
                              flex: 2,
                            ),
                            TextFormField(
                              focusNode: lc.emailFocus,
                              onSaved: (newValue) =>
                                  lc.formKey.currentState?.save(),
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.emailAddress,
                              controller: lc.emailCtrl,
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.only(
                                  left: 15,
                                  right: 15,
                                ),
                                enabledBorder: outlineInputBorder,
                                focusedBorder: outlineInputBorder,
                                errorBorder: outlineInputBorder2,
                                focusedErrorBorder: outlineInputBorder2,
                                hintText: "Email",
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter an email';
                                }

                                if (!GetUtils.isEmail(value)) {
                                  return "Invalid email";
                                }
                                return null;
                              },
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Obx(() {
                              return TextFormField(
                                focusNode: lc.passwordFocus,
                                onSaved: (newValue) =>
                                    lc.formKey.currentState?.save(),
                                textInputAction: TextInputAction.done,
                                keyboardType: TextInputType.text,
                                obscureText: lc.getIsObsecure,
                                controller: lc.passwordCtrl,
                                decoration: InputDecoration(
                                  suffixIcon: IconButton(
                                    onPressed: () {
                                      lc.isObsecure.toggle();
                                    },
                                    icon: Icon(
                                      lc.getIsObsecure
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                    ),
                                  ),
                                  contentPadding: const EdgeInsets.only(
                                    left: 15,
                                    right: 0,
                                  ),
                                  enabledBorder: outlineInputBorder,
                                  focusedBorder: outlineInputBorder,
                                  errorBorder: outlineInputBorder2,
                                  focusedErrorBorder: outlineInputBorder2,
                                  hintText: "Password",
                                  helperText: "min 6 max 12",
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter a password';
                                  }
                                  if (!GetUtils.isLengthBetween(value, 6, 12)) {
                                    return "min 6 max 12 cahracters need";
                                  }

                                  return null;
                                },
                              );
                            }),
                            SizedBox(
                              width: Get.width * 0.5,
                              child: ElevatedButton(
                                onPressed: () {
                                  lc.emailFocus.unfocus();
                                  lc.passwordFocus.unfocus();
                                  if (lc.formKey.currentState!.validate()) {
                                    AuthServices().loginUser(lc.emailCtrl.text,
                                        lc.passwordCtrl.text);
                                  }
                                },
                                child: const Text('Submit'),
                              ),
                            ),
                            const Spacer(
                              flex: 1,
                            ),
                            GestureDetector(
                              onTap: () {
                                // Get.toNamed(Routes.RESET_PASSWORD);
                              },
                              child: const Text(
                                "Forget password? reset here",
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            const Spacer(
                              flex: 6,
                            ),
                          ],
                        )),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    // Get.toNamed(Routes.SIGNUP);
                  },
                  child: const Text('Havent any account? Signup here'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
