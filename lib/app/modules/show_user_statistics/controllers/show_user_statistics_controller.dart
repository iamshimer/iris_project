import 'package:get/get.dart';

class ShowUserStatisticsController extends GetxController {
  final _listOfUsers = Get.arguments;

  List get getUsersList {
    return _listOfUsers;
  }
}
