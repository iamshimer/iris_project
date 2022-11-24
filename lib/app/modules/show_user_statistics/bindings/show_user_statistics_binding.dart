import 'package:get/get.dart';

import '../controllers/show_user_statistics_controller.dart';

class ShowUserStatisticsBinding extends Bindings {
  @override
  void dependencies() {
    Get.put( ShowUserStatisticsController());
  }
}
