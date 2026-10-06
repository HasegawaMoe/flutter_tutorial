import 'package:flutter/material.dart';
import 'package:flutter_tutorial/base_detail_screen.dart';
import 'package:flutter_tutorial/model/noodle_model.dart';

class NoodleGroupScreen extends BaseDetailScreen<NoodleModel> {
  const NoodleGroupScreen({super.key, required super.selectedFaction});

  @override
  NoodleModel fromJson(Map<String, dynamic> json) {
    return NoodleModel.fromJson(json);
  }

  @override
  Widget createId(noodleGroupModel) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'UserId : ${noodleGroupModel.userId}',
          style: TextStyle(fontSize: 17),
        ),
        Text('Id : ${noodleGroupModel.id}', style: TextStyle(fontSize: 15)),
      ],
    );
  }

  @override
  Widget createValue(noodleGroupModel) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [createLabel('Title :'), Text(noodleGroupModel.title)],
    );
  }
}
