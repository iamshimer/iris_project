import 'package:get/get.dart';

import '../modules/auth_init/bindings/auth_init_binding.dart';
import '../modules/auth_init/views/auth_init_view.dart';
import '../modules/common_interface/bindings/common_interface_binding.dart';
import '../modules/common_interface/views/common_interface_view.dart';
import '../modules/course_overview/bindings/course_overview_binding.dart';
import '../modules/course_overview/views/course_overview_view.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/my_courses/bindings/my_courses_binding.dart';
import '../modules/my_courses/views/my_courses_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/sign_up/bindings/sign_up_binding.dart';
import '../modules/sign_up/views/sign_up_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.COMMON_INTERFACE;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.COMMON_INTERFACE,
      page: () => const CommonInterfaceView(),
      binding: CommonInterfaceBinding(),
    ),
    GetPage(
      name: _Paths.AUTH_INIT,
      page: () => AuthInitView(),
      binding: AuthInitBinding(),
    ),
    GetPage(
      name: _Paths.SIGN_UP,
      page: () => SignUpView(),
      binding: SignUpBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.MY_COURSES,
      page: () => MyCoursesView(),
      binding: MyCoursesBinding(),
    ),
    GetPage(
      name: _Paths.COURSE_OVERVIEW,
      page: () => CourseOverviewView(),
      binding: CourseOverviewBinding(),
    ),
  ];
}
