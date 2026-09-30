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
  ListTile buildItem(BuildContext context, userdata) {
    // print('🌟override buildItem : start');
    return ListTile(
      title: Text('【UserId】 ${userdata.userId}'),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('【Id】 ${userdata.id}'),
          Text('【Title】 ${userdata.title}'),
        ],
      ),
    );
  }
}
