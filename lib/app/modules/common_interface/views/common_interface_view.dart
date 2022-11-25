import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:iris_project/app/common_widgets/the_drawer.dart';
import 'package:iris_project/app/modules/auth_init/views/auth_init_view.dart';

import '../controllers/common_interface_controller.dart';

class CommonInterfaceView extends GetView<CommonInterfaceController> {
  const CommonInterfaceView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return controller.getUser == null ? const AuthInitView() : MyDrawer();
    });
  }
}
