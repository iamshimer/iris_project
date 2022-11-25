import 'package:get/get.dart';
import 'package:iris_project/app/services/database_services.dart';

import '../../home/models/course_module_model.dart';

class AdminCourseOverviewController extends GetxController {
  final cM = Rx<CourseModule?>(null);
  final isLoading = true.obs;

  String courstPath = Get.arguments;

  set setCM(CourseModule? cm) {
    cM.value = cm;
  }

  CourseModule? get getCM {
    return cM.value;
  }

  @override
  void onInit() async {
    super.onInit();
    final res = await DatabaseServices().getSingleCourseModule(courstPath);
    if (res == null) {
      isLoading.value = false;
    } else {
      setCM = res;
      isLoading.value = false;
    }
  }
}
