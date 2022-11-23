import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/announcement_controller.dart';

class AnnouncementView extends GetView<AnnouncementController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AnnouncementView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'AnnouncementView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
