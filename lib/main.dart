import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_tutorial/user_detail_page.dart';
import 'package:http/http.dart' as http;
import 'sort_method_enum.dart';

import 'jsonresponse_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.blue)),
      home: const MyHomePage(title: 'User List Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<JsonResponseModel> _userList = [];
  Future? _data;

  @override
  //initStateは初回のビルド時にのみ動く　→ dataの中身は初回にgetDataで入ったデータ
  void initState() {
    super.initState();
    _data = getData();
  }

  Future<void> getData() async {
    var httpResponse = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/users'),
    );
    if (httpResponse.statusCode == 200) {
      final List<dynamic> body = jsonDecode(httpResponse.body);
      //List<dynamic> -> List<JsonResponseModel>にしたいから、body(List)の中の各Map型をJsonResponseModelクラスにする
      _userList = body.map((map) {
        return JsonResponseModel.fromJson(map);
        //     // そしてListに変換
      }).toList();
    }
    print('🌟future：$_userList[0].id}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title, style: TextStyle(color: Colors.white)),
      ),
      body: Column(
        children: [
          // ---------- PopupMenuButton ----------
          Align(
            alignment: AlignmentGeometry.centerRight,
            child: Expanded(
              child: SizedBox(
                width: 110,
                child: PopupMenuButton(
                  icon: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Text('並べ替え'), Icon(Icons.sort)],
                  ),
                  itemBuilder: (context) => [
                    // ---------- ボタンの選択肢 ----------
                    PopupMenuItem(
                      value: SortMethodEnum.ascById,
                      child: Text('IDで昇順'),
                    ),
                    PopupMenuItem(
                      value: SortMethodEnum.descById,
                      child: Text('IDで降順'),
                    ),
                    PopupMenuItem(
                      value: SortMethodEnum.ascByName,
                      child: Text('名前で昇順'),
                    ),
                    PopupMenuItem(
                      value: SortMethodEnum.descByName,
                      child: Text('名前で降順'),
                    ),
                    PopupMenuItem(
                      value: SortMethodEnum.ascByUserName,
                      child: Text('ユーザー名で昇順'),
                    ),
                    PopupMenuItem(
                      value: SortMethodEnum.descByUserName,
                      child: Text('ユーザー名で降順'),
                    ),
                  ],
                  onSelected: (value) {
                    setState(() {
                      value.sortMethod(_userList, value);
                      print('🌟button押下：${_userList[0].id}');
                    });
                  },
                ),
              ),
            ),
          ),

          // ---------- UserData一覧 ----------
          FutureBuilder(
            // ここにメソッドをそのまま入れてしまうと、再描画の時にもう一度メソッドが呼び出されてuserListが初期値に戻る
            //futureはFutureの状態がどうなっているかを確認しにいく場所
            future: _data,
            builder: (context, asyncSnapshot) {
              if (asyncSnapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              } else {
                // print('🌟再描画：${userList[0].id}');

                return Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: _userList.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        child: ListTile(
                          title: Text('名前:${_userList[index].name}'),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('ユーザーID：${_userList[index].id}'),
                              Text('ユーザー名：${_userList[index].username}'),
                            ],
                          ),
                          trailing: Icon(Icons.chevron_right),
                          iconColor: Colors.blueAccent,
                        ),

                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => UserDetailPage(
                                jsonResponseModel: _userList[index],
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                );
                // snapshotのデータを表示
              }
            },
          ),
        ],
      ),
    );
  }
}
