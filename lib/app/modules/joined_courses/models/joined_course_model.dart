class JoinedCourse {
  final String charge;
  final String courseCode;
  final String courseName;
  final int joinedAt;
  final String medium;
  final String ownerEmail;
  final String ownerUid;
  final String subscriptionMode;

  JoinedCourse({
    required this.charge,
    required this.courseCode,
    required this.courseName,
    required this.joinedAt,
    required this.medium,
    required this.ownerEmail,
    required this.ownerUid,
    required this.subscriptionMode,
  });

  factory JoinedCourse.fromMap(Map<String, dynamic> inc) {
    return JoinedCourse(
        charge: inc["charge"],
        courseCode: inc["courseCode"],
        courseName: inc["courseName"],
        joinedAt: inc["joinedAt"],
        medium: inc["medium"],
        ownerEmail: inc["ownerEmail"],
        ownerUid: inc["ownerUid"],
        subscriptionMode: inc["subscriptionMode"]);
  }
}
