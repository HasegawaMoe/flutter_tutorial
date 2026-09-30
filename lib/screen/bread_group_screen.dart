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
  ListTile buildItem(BuildContext context, userdata) {
    // print('🌟override buildItem : start');
    return ListTile(
      title: Text('【PostId】: ${userdata.postId}'),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('【Id】 ${userdata.id}'),
          Text('【Name】 ${userdata.name}'),
          Text('【Email】 ${userdata.email}'),
          Text('【Body】 ${userdata.body}'),
        ],
      ),
    );
  }
}
