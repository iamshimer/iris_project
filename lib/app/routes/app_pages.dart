import 'package:get/get.dart';

import '../modules/add_course/bindings/add_course_binding.dart';
import '../modules/add_course/views/add_course_view.dart';
import '../modules/announcement/bindings/announcement_binding.dart';
import '../modules/announcement/views/announcement_view.dart';
import '../modules/auth_init/bindings/auth_init_binding.dart';
import '../modules/auth_init/views/auth_init_view.dart';
import '../modules/common_interface/bindings/common_interface_binding.dart';
import '../modules/common_interface/views/common_interface_view.dart';
import '../modules/course_overview/bindings/course_overview_binding.dart';
import '../modules/course_overview/views/course_overview_view.dart';
import '../modules/edit_profile/bindings/edit_profile_binding.dart';
import '../modules/edit_profile/views/edit_profile_view.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/my_courses/bindings/my_courses_binding.dart';
import '../modules/my_courses/views/my_courses_view.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/show_user_statistics/bindings/show_user_statistics_binding.dart';
import '../modules/show_user_statistics/views/show_user_statistics_view.dart';
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
    GetPage(
      name: _Paths.ANNOUNCEMENT,
      page: () => AnnouncementView(),
      binding: AnnouncementBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_PROFILE,
      page: () => EditProfileView(),
      binding: EditProfileBinding(),
    ),
    GetPage(
      name: _Paths.SHOW_USER_STATISTICS,
      page: () => ShowUserStatisticsView(),
      binding: ShowUserStatisticsBinding(),
    ),
    GetPage(
      name: _Paths.ADD_COURSE,
      page: () => AddCourseView(),
      binding: AddCourseBinding(),
    ),
  ];
}
