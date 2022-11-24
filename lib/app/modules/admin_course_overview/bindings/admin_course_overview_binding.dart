import 'package:get/get.dart';

import '../controllers/admin_course_overview_controller.dart';

class AdminCourseOverviewBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AdminCourseOverviewController());
  }
}
