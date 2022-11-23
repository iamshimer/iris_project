import 'package:get/get.dart';

import '../controllers/auth_init_controller.dart';

class AuthInitBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthInitController>(
      () => AuthInitController(),
    );
  }
}
