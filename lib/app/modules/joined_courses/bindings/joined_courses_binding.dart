import 'package:get/get.dart';

import '../controllers/joined_courses_controller.dart';

class JoinedCoursesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<JoinedCoursesController>(
      () => JoinedCoursesController(),
    );
  }
}
