import 'package:flutter/material.dart';
import 'package:flutter_tutorial/base_detail_screen.dart';
import 'package:flutter_tutorial/model/not_eating_model.dart';

class NotEatingGroupScreen extends BaseDetailScreen<NotEatingModel> {
  const NotEatingGroupScreen({super.key, required super.selectedFaction});

  @override
  NotEatingModel fromJson(Map<String, dynamic> json) {
    return NotEatingModel.fromJson(json);
  }

  @override
  ListTile buildItem(BuildContext context, userdata) {
    return ListTile(
      title: Text('【Id】 ${userdata.id}'),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('【Name】 ${userdata.name}'),
          Text('【UserName】 ${userdata.username}'),
          Text('【Email】 ${userdata.email}'),
          Text(
            '【Address】  ${userdata.address.street} ${userdata.address.suite} ${userdata.address.city}',
          ),
          Text('【Zipcode】 ${userdata.address.zipcode}'),
          Text('【Geo】 ${userdata.address.geo.lat} ${userdata.address.geo.lng}'),
          Text('【Phone】 ${userdata.phone}'),
          Text('【Website】 ${userdata.website}'),
          Text('【Company】 ${userdata.company.name}'),
          Text('${userdata.company.catchPhrase} ${userdata.company.bs}'),
        ],
      ),
    );
  }
}
