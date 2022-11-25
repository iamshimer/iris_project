import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:horizontal_data_table/horizontal_data_table.dart';
import 'package:iris_project/app/modules/common_interface/controllers/common_interface_controller.dart';

import '../../../common_widgets/common_app_bar.dart';
import '../controllers/show_user_statistics_controller.dart';

class ShowUserStatisticsView extends GetView<ShowUserStatisticsController> {
  final CommonInterfaceController cic = Get.find();

  ShowUserStatisticsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: returnAppBar(cic, "Show statistics"),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: const TextSpan(
                text: "**",
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 18,
                ),
                children: <TextSpan>[
                  TextSpan(
                      text: ' Sorted by joined date decending order',
                      style: TextStyle(color: Colors.black)),
                ],
              ),
            ),
            Expanded(
              child: HorizontalDataTable(
                leftHandSideColumnWidth: 100,
                rightHandSideColumnWidth: 300,
                isFixedHeader: true,
                headerWidgets: _getTitleWidget(),
                leftSideItemBuilder: _generateFirstColumnRow,
                rightSideItemBuilder: _generateRightHandSideColumnRow,
                itemCount: controller.getUsersList.length,
                rowSeparatorWidget: const Divider(
                  color: Colors.black54,
                  height: 1.0,
                  thickness: 0.0,
                ),
                leftHandSideColBackgroundColor: const Color(0xFFFFFFFF),
                rightHandSideColBackgroundColor: const Color(0xFFFFFFFF),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _getTitleWidget() {
    return [
      _getTitleItemWidget('Name', 100),
      _getTitleItemWidget(
        'Joined date',
        180,
      ),
      _getTitleItemWidget('email', 200),
    ];
  }

  Widget _getTitleItemWidget(String label, double width) {
    return Container(
      width: width,
      height: 56,
      padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
      alignment: Alignment.centerLeft,
      child: Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
    );
  }

  Widget _generateFirstColumnRow(BuildContext context, int index) {
    return Container(
      color: Colors.amber[100],
      margin: const EdgeInsets.symmetric(vertical: 5),
      width: 100,
      height: 52,
      padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
      alignment: Alignment.centerLeft,
      child: Text(controller.getUsersList[index]["stuName"]),
    );
  }

  Widget _generateRightHandSideColumnRow(BuildContext context, int index) {
    return Row(
      children: <Widget>[
        Container(
          width: 180,
          margin: const EdgeInsets.symmetric(vertical: 5),
          height: 52,
          padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.centerLeft,
          child: Text(DateTime.fromMillisecondsSinceEpoch(
                  controller.getUsersList[index]["joinedAt"])
              .toString()),
        ),
        Expanded(
          child: Container(
            child: Text(controller.getUsersList[index]["stuEmail"]),
            width: 200,
            color: Colors.amber[100],
            margin: const EdgeInsets.symmetric(vertical: 5),
            height: 52,
            padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
            alignment: Alignment.centerLeft,
          ),
        ),
      ],
    );
  }
}
