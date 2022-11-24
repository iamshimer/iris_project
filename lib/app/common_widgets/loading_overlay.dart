import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingOverlay extends StatelessWidget {
  const LoadingOverlay({super.key, required this.isOverlay});
  final bool isOverlay;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        width: Get.width,
        height: Get.height,
        color: isOverlay ? Colors.black38 : Colors.white,
        child: Center(
          child: SpinKitFoldingCube(
            color: isOverlay ? Colors.white : Theme.of(context).primaryColor,
            size: 50.0,
          ),
        ),
      ),
    );
  }
}
