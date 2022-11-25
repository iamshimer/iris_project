class CourseModule {
  final String charge;
  final String courseCode;
  final String courseDescription;
  final String courseName;
  final List courseObjectives;
  final int createdAt;
  final int? updatedAt;
  final int? currentUserCount;
  final List? currentUsers;
  final String medium;
  final String? ownerEmail;
  final String? ownerUid;
  final List studentInstructions;
  final String subscriptionMode;
  final String? courseDocId;

  CourseModule({
    required this.charge,
    required this.courseCode,
    required this.courseDescription,
    required this.courseName,
    required this.courseObjectives,
    required this.createdAt,
    required this.updatedAt,
    required this.currentUserCount,
    required this.currentUsers,
    required this.medium,
    required this.ownerEmail,
    required this.ownerUid,
    required this.studentInstructions,
    required this.subscriptionMode,
    required this.courseDocId,
  });

  factory CourseModule.fromMap(Map<String, dynamic> inc) {
    return CourseModule(
      courseDocId: inc.containsKey("id")
          ? inc["id"]
          : inc.containsKey("courseDocId")
              ? inc["courseDocId"]
              : null,
      charge: inc["charge"],
      courseCode: inc["courseCode"],
      courseDescription: inc["courseDescription"],
      courseName: inc["courseName"],
      courseObjectives: inc["courseObjectives"],
      createdAt: inc["createdAt"],
      updatedAt: inc.containsKey("updatedAt") ? inc["updatedAt"] : null,
      currentUserCount:
          inc.containsKey("currentUserCount") ? inc["currentUserCount"] : null,
      currentUsers:
          inc.containsKey("currentUsers") ? inc["currentUsers"] : null,
      medium: inc["medium"],
      ownerEmail: inc.containsKey("ownerEmail") ? inc["ownerEmail"] : null,
      ownerUid: inc.containsKey("ownerUid") ? inc["ownerUid"] : null,
      studentInstructions: inc["studentInstructions"],
      subscriptionMode: inc["subscriptionMode"],
    );
  }
}
