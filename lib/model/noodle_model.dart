class NoodleModel {
  final int userId;
  final int id;
  final String title;

  NoodleModel({required this.userId, required this.id, required this.title});

  factory NoodleModel.fromJson(Map<String, dynamic> json) {
    return NoodleModel(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
    );
  }
}
