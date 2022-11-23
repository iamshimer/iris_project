import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:iris_project/app/modules/common_interface/bindings/common_interface_binding.dart';

import 'app/routes/app_pages.dart';
import 'app/utils/theme_service.dart';
import 'firebase_options.dart';

void main() async {
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeService().theme,
      defaultTransition: Transition.cupertino,
      initialBinding: CommonInterfaceBinding(),
      debugShowCheckedModeBanner: false,
    ),
  );
}
