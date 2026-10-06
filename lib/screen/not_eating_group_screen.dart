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
  Widget createId(notEatingGroupModel) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Id : ${notEatingGroupModel.id}', style: TextStyle(fontSize: 17)),
      ],
    );
  }

  @override
  Widget createValue(notEatingGroupModel) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        createLabel('Name :'),
        Text(notEatingGroupModel.name),
        createLabel('UserName :'),
        Text(notEatingGroupModel.username),
        createLabel('Email :'),
        Text(notEatingGroupModel.email),
        createLabel('Address :'),
        Text(
          '${notEatingGroupModel.address.street} ${notEatingGroupModel.address.suite} ${notEatingGroupModel.address.city}',
        ),
        createLabel('Zipcode :'),
        Text(notEatingGroupModel.address.zipcode),
        createLabel('Geo :'),
        Text(
          '${notEatingGroupModel.address.geo.lat} ${notEatingGroupModel.address.geo.lng}',
        ),
        createLabel('Phone :'),
        Text(notEatingGroupModel.phone),
        createLabel('Website :'),
        Text(notEatingGroupModel.website),
        createLabel('Company :'),
        Text(notEatingGroupModel.company.name),
        Text(
          '${notEatingGroupModel.company.catchPhrase} ${notEatingGroupModel.company.bs}',
        ),
      ],
    );
  }
}
