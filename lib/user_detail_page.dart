import 'package:flutter/material.dart';
import 'package:flutter_tutorial/jsonresponse_model.dart';

class UserDetailPage extends StatelessWidget {
  final JsonResponseModel _jsonResponseModel;
  const UserDetailPage({super.key, required this._jsonResponseModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.navigate_before_rounded,
            size: 40,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('User Detail Page', style: TextStyle(color: Colors.white)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(Icons.account_circle, size: 80),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      makeTextDetail('ID: ${_jsonResponseModel.id}'),
                      makeTextDetail(_jsonResponseModel.username),
                    ],
                  ),
                ],
              ),

              //---------- ユーザー詳細情報 ----------
              makeHeader('Name'),
              makeTextDetail(_jsonResponseModel.name),

              makeHeader('E-mail'),
              makeTextDetail(_jsonResponseModel.email),

              makeHeader('Zipcode'),
              makeTextDetail(_jsonResponseModel.address.zipcode),

              makeHeader('Address'),
              makeTextDetail(
                '${_jsonResponseModel.address.suite} ${_jsonResponseModel.address.street} ${_jsonResponseModel.address.city}',
              ),

              makeHeader('Geography'),
              makeTextDetail('Latitude: ${_jsonResponseModel.address.geo.lat}'),
              makeTextDetail(
                'Longitude: ${_jsonResponseModel.address.geo.lng}',
              ),

              makeHeader('Phone'),
              makeTextDetail(_jsonResponseModel.phone),

              makeHeader('Website'),
              makeTextDetail(_jsonResponseModel.website),

              makeHeader('Company'),
              makeTextDetail(
                'Company Name: ${_jsonResponseModel.company.name}',
              ),

              makeTextDetail(
                'CatchPhrase: ${_jsonResponseModel.company.catchPhrase}',
              ),
              makeTextDetail('Business: ${_jsonResponseModel.company.bs}'),
            ],
          ),
        ),
      ),
    );
  }

  //---------- メソッド ----------
  Widget makeHeader(String part) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Text(
        '$part：',
        style: TextStyle(
          color: Colors.blue,
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
    );
  }

  Widget makeTextDetail(String a) {
    return Text(a, style: TextStyle(fontSize: 16));
  }
}
