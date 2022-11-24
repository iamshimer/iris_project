import 'package:iris_project/app/modules/home/models/course_module_model.dart';

class UserProvider {
  final int createdAt;
  final String email;
  final String name;
  final String gender;
  final String uid;
  final String role;
  final List? joinedCourses;
  final List<CourseModule>? myCourses;
  final int age;

  UserProvider({
    required this.createdAt,
    required this.email,
    required this.name,
    required this.gender,
    required this.uid,
    required this.role,
    required this.joinedCourses,
    required this.myCourses,
    required this.age,
  });

  factory UserProvider.fromMap(Map<String, dynamic> inc) {
    // print(" UP ${inc["myCourses"]}");
    return UserProvider(
      createdAt: inc["createdAt"],
      email: inc["email"],
      role: inc["role"],
      name: inc["name"],
      uid: inc["uid"],
      gender: inc["gender"],
      joinedCourses: inc["joinedCourses"],
      age: inc["age"],
      myCourses: convertToModeledList(inc["myCourses"]),
    );
  }
}

List<CourseModule>? convertToModeledList(List<dynamic> incList) {
  List<CourseModule>? tempArr = [];
  for (var i in incList) {
    tempArr.add(CourseModule.fromMap(i));
  }
  print(tempArr);

  return tempArr;
}
