import 'package:flutter_tutorial/member_model.dart';

class GroupModel {
  String? groupName = "";
  //画像
  String? image = "";
  int? formation = 0;
  List<Member> members = [];

  GroupModel({
    required this.groupName,
    required this.image,
    required this.formation,
    required this.members,
  });
}
