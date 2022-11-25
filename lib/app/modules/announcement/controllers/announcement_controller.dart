import 'package:get/get.dart';
import 'package:iris_project/app/modules/home/models/announcement_model.dart';

class AnnouncementController extends GetxController {
  final _annModel = Rx<AnnouncementModel>(Get.arguments);

  AnnouncementModel get getModelData {
    return _annModel.value;
  }
}
