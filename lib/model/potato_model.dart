class PotatoModel {
  final int userId;
  final int id;
  final String title;
  final bool completed;

  PotatoModel({
    required this.userId,
    required this.id,
    required this.title,
    required this.completed,
  });

  factory PotatoModel.fromJson(Map<String, dynamic> json) {
    return PotatoModel(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      completed: json['completed'],
    );
  }
}
