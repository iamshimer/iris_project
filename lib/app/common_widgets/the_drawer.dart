import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iris_project/app/modules/my_courses/views/my_courses_view.dart';
import 'package:iris_project/app/services/auth_services.dart';
import 'package:iris_project/app/utils/theme_service.dart';
import 'dart:math' as math show Random;

import '../modules/common_interface/controllers/common_interface_controller.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/views/login_view.dart';
import '../modules/profile/views/profile_view.dart';
import '../routes/app_pages.dart';

class MyDrawer extends StatefulWidget {
  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  final CommonInterfaceController cic = Get.find();
  String shownPage = Routes.HOME;

  @override
  Widget build(BuildContext context) {
    const colortileSelected = Colors.blue;
    const tileCol = Colors.amber;
    const textStyle = TextStyle(
      color: Colors.white,
    );

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(16),
              // top: Radius.circular(10),
            ),
          ),
          title: Text(returnTitle()),
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
                setState(() {
                  shownPage = Routes.HOME;
                });
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
        ),
        body: renderPage(),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              // DrawerHeader(
              //     decoration: BoxDecoration(

              //       color: Colors.blue,
              //     ),
              //     child: Obx(() => Text(
              //           cic.getUserAdditional?.email ?? "-------",
              //           textScaleFactor: 1.5,
              //         ))),
              eachTile(tileCol, colortileSelected, textStyle, context),
              ListTile(
                tileColor: tileCol,
                selectedTileColor: colortileSelected,
                selected: shownPage == Routes.PROFILE ? true : false,
                title: const Text(
                  'Profile',
                  style: textStyle,
                ),
                onTap: () {
                  if (shownPage == Routes.PROFILE) {
                    return Navigator.pop(context);
                  }

                  setState(() {
                    shownPage = Routes.PROFILE;
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                tileColor: tileCol,
                selectedTileColor: colortileSelected,
                selected: shownPage == Routes.MY_COURSES ? true : false,
                title: const Text(
                  "My courses",
                  style: textStyle,
                ),
                onTap: () {
                  if (shownPage == Routes.MY_COURSES) {
                    return Navigator.pop(context);
                  }

                  setState(() {
                    shownPage = Routes.MY_COURSES;
                  });
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  ListTile eachTile(MaterialColor tileCol, MaterialColor colortileSelected,
      TextStyle textStyle, BuildContext context) {
    const textStyle = TextStyle(
      color: Colors.white,
    );
    return ListTile(
      tileColor: tileCol,
      selectedTileColor: colortileSelected,
      selected: shownPage == Routes.HOME ? true : false,
      title: const Text(
        'Home',
        style: textStyle,
      ),
      onTap: () {
        if (shownPage == Routes.HOME) {
          return Navigator.pop(context);
        }

        setState(() {
          shownPage = Routes.HOME;
        });
        Navigator.pop(context);
      },
    );
  }

  Widget renderPage() {
    switch (shownPage) {
      case Routes.HOME:
        {
          return HomeView();
        }
      case Routes.PROFILE:
        {
          return ProfileView();
        }
      case Routes.MY_COURSES:
        {
          return MyCoursesView();
        }

      default:
        {
          return LoginView();
        }
    }
  }

  String returnTitle() {
    switch (shownPage) {
      case Routes.HOME:
        {
          return "Home";
        }
      case Routes.PROFILE:
        {
          return "Profile";
        }
      case Routes.MY_COURSES:
        {
          return "My courses";
        }

      default:
        {
          return "Title";
        }
    }
  }
}
