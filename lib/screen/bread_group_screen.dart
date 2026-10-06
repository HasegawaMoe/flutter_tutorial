import 'package:flutter/material.dart';
import 'package:flutter_tutorial/base_detail_screen.dart';
import 'package:flutter_tutorial/model/bread_model.dart';

class BreadGroupScreen extends BaseDetailScreen<BreadModel> {
  const BreadGroupScreen({super.key, required super.selectedFaction});

  @override
  BreadModel fromJson(Map<String, dynamic> json) {
    return BreadModel.fromJson(json);
  }

  @override
  Widget createId(breadGroupModel) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'PostId : ${breadGroupModel.postId}',
          style: TextStyle(fontSize: 17),
        ),
        Text('Id : ${breadGroupModel.id}', style: TextStyle(fontSize: 15)),
      ],
    );
  }

  @override
  Widget createValue(breadGroupModel) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        createLabel('Name :'),
        Text(breadGroupModel.name),
        createLabel('Email :'),
        Text(breadGroupModel.email),
        createLabel('Body :'),
        Text(breadGroupModel.body),
      ],
    );
  }
}
