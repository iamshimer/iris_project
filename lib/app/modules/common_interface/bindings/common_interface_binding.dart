import 'package:get/get.dart';

import '../controllers/common_interface_controller.dart';

class CommonInterfaceBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(
      CommonInterfaceController(),
      permanent: true,
    );
  }
}
