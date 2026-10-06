import 'package:flutter/material.dart';
import 'package:flutter_tutorial/base_detail_screen.dart';
import 'package:flutter_tutorial/model/Potato_model.dart';

class PotatoGroupScreen extends BaseDetailScreen<PotatoModel> {
  const PotatoGroupScreen({super.key, required super.selectedFaction});

  @override
  PotatoModel fromJson(Map<String, dynamic> json) {
    return PotatoModel.fromJson(json);
  }

  @override
  Widget createId(userdata) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('UserId : ${userdata.userId}', style: TextStyle(fontSize: 17)),
        Text('Id : ${userdata.id}', style: TextStyle(fontSize: 15)),
      ],
    );
  }

  @override
  Widget createValue(userdata) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        createLabel('Title :'),
        Text(userdata.title),
        createLabel('Completed :'),
        Text('$userdata.completed'),
      ],
    );
  }
}
