import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_tutorial/faction_enum.dart';
import 'package:http/http.dart' as http;

// BaseDetailScreen<T> : Tに入る型を指定できるようにしている
abstract class BaseDetailScreen<T> extends StatefulWidget {
  const BaseDetailScreen({super.key, required this.selectedFaction});
  final FactionEnum selectedFaction;
  T fromJson(Map<String, dynamic> json);
  // ListTile buildItem(BuildContext context, T item);
  Widget createValue(T item);
  Widget createId(T item);
  Widget createLabel(String text) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Text(
        text,
        style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
      ),
    );
  }

  @override
  //statefulに使うためのstateを指示している（今回はGroupScreen）
  //→　抽象クラスにしなくて良い
  State<BaseDetailScreen> createState() => GroupScreen();
}

class GroupScreen extends State<BaseDetailScreen> {
  List<dynamic> _dataList = [];
  Future? _body;
  @override
  void initState() {
    super.initState();
    _body = getBody();
  }

  Future<void> getBody() async {
    var httpResponse = await http.get(Uri.parse(widget.selectedFaction.url));
    if (httpResponse.statusCode == 200) {
      final List<dynamic> json = jsonDecode(httpResponse.body);
      _dataList = json.map((map) {
        // RiceModel.fromJson(map);をモデルに変換
        return widget.fromJson(map);
      }).toList();
    } else {
      try {
        throw Exception('⚠️通信できません');
      } catch (e) {
        print('$e');
      }
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
            size: 50,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(
          '${widget.selectedFaction.japanese}派のユーザー一覧',
          style: TextStyle(color: Colors.white),
        ),

        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                _dataList = [];
              });
            },
            icon: Icon(Icons.delete, color: Colors.white),
          ),
        ],
      ),
      body: FutureBuilder(
        future: _body,
        builder: (context, asyncSnapshot) {
          if (asyncSnapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (asyncSnapshot.hasError) {
            return Text('${asyncSnapshot.error}');
          } else if (_dataList.isEmpty) {
            return Text('表示できるデータがありません');
          } else {
            return createList(_dataList);
          }
        },
      ),
    );
  }

  // ---------- データを取得した後に実行されるメソッド ----------
  Widget createList(List<dynamic> userList) {
    return Scrollbar(
      thumbVisibility: true,
      child: ListView.separated(
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
          return Padding(
            padding: const EdgeInsets.all(20),
            child: ListTile(
              title: Row(
                children: [
                  Icon(Icons.account_box, size: 60),
                  SizedBox(width: 10),
                  widget.createId(userList[index]),
                ],
              ),
              subtitle: widget.createValue(userList[index]),
            ),
          );
        },
      ),
    );
  }
}
