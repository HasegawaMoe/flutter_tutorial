import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_tutorial/faction_enum.dart';
// import 'package:flutter_tutorial/model/rice_model.dart';
import 'package:http/http.dart' as http;

// BaseDetailScreen<T> : Tに入る型を指定できるようにしている
abstract class BaseDetailScreen<T> extends StatefulWidget {
  const BaseDetailScreen({super.key, required this.selectedFaction});
  final FactionEnum selectedFaction;
  T fromJson(Map<String, dynamic> json);
  ListTile buildItem(BuildContext context, T item);
  @override
  //statefulに使うためのstateを指示している（今回はGroupScreen）
  //→　抽象クラスにしなくて良い
  State<BaseDetailScreen> createState() => GroupScreen();
}

class GroupScreen extends State<BaseDetailScreen> {
  List<dynamic> dataList = [];
  @override
  void initState() {
    super.initState();
    getBody();
  }

  Future<void> getBody() async {
    var httpResponse = await http.get(Uri.parse(widget.selectedFaction.url));
    if (httpResponse.statusCode == 200) {
      final List<dynamic> json = jsonDecode(httpResponse.body);
      dataList = json.map((map) {
        // RiceModel.fromJson(map);をモデルに変換
        return widget.fromJson(map);
      }).toList();
    } else {
      throw Exception('🛜通信できません');
    }
  }

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
        title: Text(
          '${widget.selectedFaction.japanese}派のユーザー一覧',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: FutureBuilder(
        future: getBody(),
        builder: (context, asyncSnapshot) {
          if (asyncSnapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else {
            return createList(dataList);
          }
        },
      ),
    );
  }

  Widget createList(List<dynamic> userList) {
    return ListView.separated(
      shrinkWrap: true,
      itemCount: userList.length,
      separatorBuilder: (context, index) {
        return const SizedBox(
          height: 1.0,
          width: double.infinity,
          child: ColoredBox(color: Colors.grey),
        );
      },
      itemBuilder: (context, index) {
        // print('🌟itemBuilder : start');
        return widget.buildItem(context, userList[index]);

        // return ListTile(
        //   title: Text('UserId: ${a[index].userId}'),
        //   subtitle: Column(
        //     crossAxisAlignment: CrossAxisAlignment.start,
        //     children: [
        //       Text('Id: ${a[index].id}'),
        //       Text('Title: ${a[index].title}'),
        //       Text('Body: ${a[index].body}'),
        //     ],
        //   ),
        // );
      },
    );
  }
}
