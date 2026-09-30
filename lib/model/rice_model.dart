class RiceModel {
  final int userId;
  final int id;
  final String title;
  final String body;

  RiceModel({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  factory RiceModel.fromJson(Map<String, dynamic> json) {
    return RiceModel(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }
}
