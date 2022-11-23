// ignore_for_file: sort_child_properties_last, prefer_const_constructors

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:horizontal_data_table/horizontal_data_table.dart';
import 'package:iris_project/app/modules/common_interface/controllers/common_interface_controller.dart';

import '../../../common_widgets/common_app_bar.dart';
import '../controllers/show_user_statistics_controller.dart';

class ShowUserStatisticsView extends GetView<ShowUserStatisticsController> {
  final CommonInterfaceController cic = Get.find();
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
              text: TextSpan(
                text: "**",
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 18,
                ),
                children: const <TextSpan>[
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
                itemCount: 20,
                rowSeparatorWidget: const Divider(
                  color: Colors.black54,
                  height: 1.0,
                  thickness: 0.0,
                ),
                leftHandSideColBackgroundColor: Color(0xFFFFFFFF),
                rightHandSideColBackgroundColor: Color(0xFFFFFFFF),
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
      _getTitleItemWidget('Joined date', 100),
      _getTitleItemWidget('email', 200),
    ];
  }

  Widget _getTitleItemWidget(String label, double width) {
    return Container(
      child: Text(label, style: TextStyle(fontWeight: FontWeight.bold)),
      width: width,
      height: 56,
      padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
      alignment: Alignment.centerLeft,
    );
  }

  Widget _generateFirstColumnRow(BuildContext context, int index) {
    return Container(
      width: 100,
      height: 52,
      padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
      alignment: Alignment.centerLeft,
      child: const Text("NnAmE"),
    );
  }

  Widget _generateRightHandSideColumnRow(BuildContext context, int index) {
    return Row(
      children: <Widget>[
        Container(
          child: Text("2022.03.22"),
          width: 100,
          height: 52,
          padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.centerLeft,
        ),
        Container(
          child: Text("ahamadshimer@gmail.com"),
          width: 200,
          height: 52,
          padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.centerLeft,
        ),
      ],
    );
  }
}
