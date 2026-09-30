class BreadModel {
  final int postId;
  final int id;
  final String name;
  final String email;
  final String body;

  BreadModel({
    required this.postId,
    required this.id,
    required this.name,
    required this.email,
    required this.body,
  });

  factory BreadModel.fromJson(Map<String, dynamic> json) {
    return BreadModel(
      postId: json['postId'],
      id: json['id'],
      name: json['name'],
      email: json['email'],
      body: json['body'],
    );
  }
}
