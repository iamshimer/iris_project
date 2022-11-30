// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iris_project/app/modules/add_announcement/views/add_announcement_view.dart';
import 'package:iris_project/app/modules/joined_courses/views/joined_courses_view.dart';
import 'package:iris_project/app/modules/my_courses/views/my_courses_view.dart';
import 'package:iris_project/app/services/auth_services.dart';
import 'package:iris_project/app/utils/theme_service.dart';

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
    const colortileSelected = Colors.white;
    const tileCol = Colors.cyan;
    const textStyle = TextStyle(
      color: Colors.white,
    );

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.cyan,
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
                // cic.setUserAddiVal = null;
                // cic.setUser = null;
                AuthServices().logOut();
                // Get.offNamedUntil(Routes.AUTH_INIT,
                //     (route) => Get.currentRoute == Routes.COMMON_INTERFACE);

                // Get.offAllNamed(
                //   Routes.AUTH_INIT,
                //   predicate: (route) =>
                //       Get.currentRoute == Routes.COMMON_INTERFACE,
                // );
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
          backgroundColor: Colors.cyan,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
          ),
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              eachTile(tileCol, colortileSelected, textStyle, context, "Home",
                  Routes.HOME),
              eachTile(tileCol, colortileSelected, textStyle, context,
                  "Profile", Routes.PROFILE),
              Obx(
                () => cic.isTutor
                    ? eachTile(tileCol, colortileSelected, textStyle, context,
                        "My courses", Routes.MY_COURSES)
                    : const SizedBox(),
              ),
              Obx(
                () => cic.isTutor
                    ? eachTile(tileCol, colortileSelected, textStyle, context,
                        "Add announcement", Routes.ADD_ANNOUNCEMENT)
                    : const SizedBox(),
              ),
              Obx(
                () => !cic.isTutor
                    ? eachTile(tileCol, colortileSelected, textStyle, context,
                        "Joined courses", Routes.JOINED_COURSES)
                    : const SizedBox(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  ListTile eachTile(
      MaterialColor tileCol,
      Color colortileSelected,
      TextStyle textStyle,
      BuildContext context,
      String tileTitle,
      String routeString) {
    const textStyle = TextStyle(
      color: Colors.white,
    );
    return ListTile(
      tileColor: tileCol,
      selectedTileColor: colortileSelected,
      selected: shownPage == routeString ? true : false,
      title: Text(
        tileTitle,
        style: shownPage == routeString
            ? TextStyle(
                color: Colors.black,
              )
            : textStyle,
      ),
      onTap: () {
        if (shownPage == routeString) {
          return Get.back();
        }

        setState(() {
          shownPage = routeString;
        });
        Get.back();
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
      case Routes.ADD_ANNOUNCEMENT:
        {
          return AddAnnouncementView();
        }
      case Routes.JOINED_COURSES:
        {
          return JoinedCoursesView();
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
      case Routes.ADD_ANNOUNCEMENT:
        {
          return "Add announcements";
        }
      case Routes.JOINED_COURSES:
        {
          return "Joined courses";
        }

      default:
        {
          return "Title";
        }
    }
  }
}
