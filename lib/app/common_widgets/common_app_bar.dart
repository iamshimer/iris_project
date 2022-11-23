import 'package:flutter/material.dart';

import '../modules/common_interface/controllers/common_interface_controller.dart';
import '../services/auth_services.dart';
import '../utils/theme_service.dart';

AppBar returnAppBar(CommonInterfaceController cic, String title) {
  return AppBar(
    centerTitle: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        bottom: Radius.circular(16),
        // top: Radius.circular(10),
      ),
    ),
    title: Text(title),
    actions: <Widget>[
      IconButton(
          onPressed: () {
            ThemeService().switchTheme();
          },
          icon: const Icon(Icons.dark_mode)),
      PopupMenuButton<String>(
        position: PopupMenuPosition.under,
        tooltip: "Options",
        onSelected: (dsdsd) {
          cic.setUserAddiVal = null;
          cic.setUser = null;
          AuthServices().logOut();
        },
        itemBuilder: (BuildContext context) {
          return {'Logout'}.map((String choice) {
            return PopupMenuItem<String>(
              value: choice,
              child: Text(choice),
            );
          }).toList();
        },
      ),
    ],
  );
}
