// ignore_for_file: avoid_print

class AnnouncementModel {
  final String courseName;
  final int createdAt;
  final String message;
  final String ownerName;
  final String title;

  AnnouncementModel({
    required this.courseName,
    required this.createdAt,
    required this.message,
    required this.ownerName,
    required this.title,
  });

  factory AnnouncementModel.fromMap(Map<String, dynamic> inc) {
    print("object ${inc.toString()}");
    return AnnouncementModel(
      courseName: inc["annCourseName"],
      createdAt: inc["annCreatedAt"],
      message: inc["annMessage"],
      ownerName: inc["annOwnerName"],
      title: inc["annTitle"],
    );
  }
}
