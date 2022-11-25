import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:iris_project/app/common_widgets/loading_overlay.dart';
import 'package:iris_project/app/services/auth_services.dart';

import '../../../common_widgets/rounded_input_borders.dart';
import '../../common_interface/controllers/common_interface_controller.dart';
import '../controllers/login_controller.dart';

class LoginView extends StatelessWidget {
  final CommonInterfaceController cic = Get.find();
  final LoginController lc = Get.put(LoginController());

  LoginView({Key? key}) : super(key: key);
  final Shader linearGradient = const LinearGradient(
    colors: <Color>[Colors.pink, Colors.green],
  ).createShader(
    const Rect.fromLTWH(0.0, 0.0, 200.0, 70.0),
  );
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  // color: Colors.red,
                  width: Get.width,
                  alignment: Alignment.bottomCenter,
                  height: 250,
                  child: Image.asset(
                    "assets/images/logo.png",
                    width: Get.width * 0.5,
                  ),
                ),
                Center(
                    child: RichText(
                  text: TextSpan(
                    text: 'Login ',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        // color: Colors.black,
                        fontSize: 60,
                        foreground: Paint()..shader = linearGradient),
                    children: const <TextSpan>[
                      TextSpan(
                          text: 'with',
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            color: Colors.black,
                            fontSize: 20,
                          )),
                      TextSpan(
                          text: ' happy!',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 25,
                          )),
                    ],
                  ),
                )),
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
                              flex: 1,
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
                                    Get.showOverlay(
                                        asyncFunction: () => AuthServices()
                                            .loginUser(lc.emailCtrl.text,
                                                lc.passwordCtrl.text),
                                        loadingWidget: const LoadingOverlay(
                                          isOverlay: true,
                                        ));
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                    shape: const StadiumBorder()),
                                child: const Text(
                                  'login',
                                  style: TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
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
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: SizedBox(
                    width: Get.width * 0.30,
                    child: ElevatedButton.icon(
                      icon: const Icon(Icons.arrow_back),
                      style: ElevatedButton.styleFrom(
                          shape: const StadiumBorder()),
                      onPressed: () {
                        Get.back();
                      },
                      label: const Text("Back"),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
