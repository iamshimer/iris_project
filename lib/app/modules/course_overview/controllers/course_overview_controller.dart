import 'package:get/get.dart';

import '../../home/models/course_module_model.dart';

class CourseOverviewController extends GetxController {
  final _mdl = Rx<CourseModule>(Get.arguments);

  CourseModule get getCModule {
    return _mdl.value;
  }
}
