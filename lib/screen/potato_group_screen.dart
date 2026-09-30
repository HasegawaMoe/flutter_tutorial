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
  ListTile buildItem(BuildContext context, userdata) {
    print('🌟override buildItem : start');
    return ListTile(
      title: Text('【UserId】 ${userdata.userId}'),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('【Id】 ${userdata.id}'),
          Text('【Title】 ${userdata.title}'),
          Text('【Completed】 ${userdata.completed}'),
        ],
      ),
    );
  }
}
