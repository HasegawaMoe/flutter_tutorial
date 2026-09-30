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
  ListTile buildItem(BuildContext context, userdata) {
    print('🌟override buildItem : start');
    return ListTile(
      title: Text('【UserId】 ${userdata.userId}'),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('【Id】 ${userdata.id}'),
          Text('【Title】 ${userdata.title}'),
          Text('【Body】 ${userdata.body}'),
        ],
      ),
    );
  }
}
