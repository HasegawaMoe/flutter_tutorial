import 'package:flutter/material.dart';
import 'package:flutter_tutorial/base_detail_screen.dart';
import 'package:flutter_tutorial/model/rice_model.dart';

class RiceGroupScreen extends BaseDetailScreen<RiceModel> {
  const RiceGroupScreen({super.key, required super.selectedFaction});

  @override
  RiceModel fromJson(Map<String, dynamic> json) {
    return RiceModel.fromJson(json);
  }

  @override
  Widget createId(riceGroupModel) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'UserId : ${riceGroupModel.userId}',
          style: TextStyle(fontSize: 17),
        ),
        Text('Id : ${riceGroupModel.id}', style: TextStyle(fontSize: 15)),
      ],
    );
  }

  @override
  Widget createValue(riceGroupModel) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        createLabel('Title :'),
        Text(riceGroupModel.title),
        createLabel('Body :'),
        Text(riceGroupModel.body),
      ],
    );
  }
}
