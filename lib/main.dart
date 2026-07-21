import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:flutter/services.dart';
import 'package:flutter_tutorial/next_page.dart';

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
      theme:ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: .fromSeed(seedColor: Colors.blue),

      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

// TextFormFieldをタッチした時にキーボードを表示させない
// class AlwaysDisabledFocusNode extends FocusNode {
//   @override
//   bool get hasFocus => false;
// }

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

//ラジオボタンの性別の型
enum Gender { male, female, other }


class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _controller = TextEditingController(text: "選択してください");

  int nextValue = 0;
  num? parseValue;
  // int radioValue = 0;
  Gender? gender;

  String selectedItem = "none";








  void showPicker() {
    final List<String> prefectures = [
      "北海道",
      "青森",
      "秋田",
      "岩手",
      '宮城',
      '秋田',
      '山形',
      '福島',
      '茨城',
      '栃木',
      '群馬',
      '埼玉',
      '千葉',
      '東京',
      '神奈川',
      '新潟',
      '富山',
      '石川',
      '福井',
      '山梨',
      '長野',
      '岐阜',
      '静岡',
      '愛知',
      '三重',
      '滋賀',
      '京都',
      '大阪',
      '兵庫',
      '奈良',
      '和歌山',
      '鳥取',
      '島根',
      '岡山',
      '広島',
      '山口',
      '徳島',
      '香川',
      '愛媛',
      '高知',
      '福岡',
      '佐賀',
      '長崎',
      '熊本',
      '大分',
      '宮崎',
      '鹿児島',
      '沖縄',
    ];

    //TextウィジェットのListに変換している
    final pickerItems = prefectures.map((item) => Text(item)).toList();

    var selectedIndex = 0;

    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) {
        //下からせりあがってくる画面
        return SizedBox(
          height: 216,
          child: GestureDetector(
            //タップした時にする動き
            onTap: (){
              _controller.text = prefectures[selectedIndex]; 
              Navigator.pop(context);
            },
          //この部分をタップするとき
          child: CupertinoPicker(
            backgroundColor: Colors.white,
            //選択肢１個の縦のサイズ
            itemExtent: 32,
            onSelectedItemChanged: (int index) {
              selectedIndex = index;
              _controller.text = prefectures[selectedIndex];
            },
            //Textウィジェットになったリストを表示
            children: pickerItems
            ),
          ),
        );
      });
  }

  // 
  // void _incrementCounter() {
  //   setState(() {
  //     // This call to setState tells the Flutter framework that something has
  //     // changed in this State, which causes it to rerun the build method below
  //     // so that the display can reflect the updated values. If we changed
  //     // _counter without calling setState(), then the build method would not be
  //     // called again, and so nothing would appear to happen.
  //     _counter++;
  //   });
  // }

  void next(String a){
      parseValue = num.tryParse(a);
      if(parseValue == null){
        showDialog<void>(
          context: context,
          builder: (_){
            return AlertDialog( 
              title: Text("入力が間違っています"),
              content: Text("数字を入力してください"),
              actions: <Widget>[
                FloatingActionButton(
                  child: Text("はい"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  }            
                )
              ],
            );
          }
        );
      }else{
        //nullじゃなかったら(数字に変換できれば)次のページに遷移
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => NextPage(parseValue!)),
        );
      }
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      // backgroundColor: Colors.pink,
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: .center,
          children: [
            
            //コントローラーを使ってテキストフィールドに入力した文字をデバックに出力する
            // SizedBox(
            //   width: 300,
            //   child: TextField(
            //     controller: _controller,
            //     autofocus: false,
            //     maxLength: 10,
            //     decoration: InputDecoration(
            //       border: OutlineInputBorder(),
            //       labelText: "入力してください"
            //     ),

            //     onChanged: (value) {
            //       _controller.text = value;
            //       print('デバッグ：${_controller.text}');
            //     } ,
            //     onSubmitted: (value) {
            //       _controller.clear();
            //     },
            //   ),
            // ),

            //名前入力フォーム
            SizedBox(
              width: 300,
              child:Column(
                //すべての子要素がcolumnの幅に合わせて広がる
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text("氏名",
                  textAlign: TextAlign.left,),
                  TextFormField(
                    textAlign: TextAlign.center,
                    // controller: _controller,
                    decoration: InputDecoration(
                      floatingLabelStyle: TextStyle(
                        fontSize: 12.0
                      ),
                      hintText: "山田 太郎",
                      hintStyle: TextStyle(
                        //ヒントテキストの透明度を変更
                        color: Colors.grey.withValues(alpha: 0.7),
                        
                      )
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(
              height: 40,
            ),


            //性別のラジオボタン
            SizedBox(
              width: 300,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text("性別",
                  textAlign: TextAlign.left,),
                  RadioGroup<Gender>(
                    groupValue:  gender,
                     onChanged: (Gender? newValue){
                      setState(() {
                        gender = newValue!;
                        // print(gender);
                      });
                     },
                     child: Padding(
                      //Rowの両サイドの空間
                       padding: EdgeInsets.symmetric(horizontal: 30),
                       child: Row(
                        children: [
                          
                          //ラジオボタンの両側の空間
                          // SizedBox(
                          //   width: 30,
                          // ),
                          
                          Expanded(
                            child: RadioListTile<Gender>(
                              horizontalTitleGap: 0,
                              contentPadding: EdgeInsets.zero,
                              value: Gender.male,
                              title: Text(
                                "男性",
                                style: TextStyle(
                                  fontSize: 12.0,
                                         
                                ),
                              ),
                              ),
                          ),
                          Expanded(
                            child: RadioListTile<Gender>(
                              horizontalTitleGap: 0,
                              contentPadding: EdgeInsets.zero,
                              value: Gender.female,
                              title: Text(
                                "女性",
                                style: TextStyle(
                                  fontSize: 12.0,
                                ),
                                )
                              ),
                          ),
                          Expanded(
                            child: RadioListTile<Gender>(
                              horizontalTitleGap: 0,
                              contentPadding: EdgeInsets.zero,
                              value: Gender.other,
                              title: Text(
                                "その他",
                                style: TextStyle(
                                  fontSize: 12.0,
                                ),)
                              ),
                          ),
                          // //ラジオボタンの両サイドの空間
                          // SizedBox(
                          //   width: 30,
                          // ),
                                
                        ],
                       ),
                     )
                  ),
                ],
              ),
            ),


            SizedBox(
              height: 40,
            ),


            //出身地のドラムロールピッカー
            SizedBox(
              width: 300,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text("出身地"),
                  TextFormField(
                    readOnly: true,
                    textAlign: TextAlign.center,
                    controller: _controller,
                    // canRequestFocus: false,
                    // TextFormFieldをタッチした時にキーボードを表示させない
                    // focusNode: AlwaysDisabledFocusNode(),
                    onTap: () {
                      showPicker();
                    },
                    
                    
                    
                    ),
                ],
              ),
            ),
              



            
            SizedBox(
              height: 40,
            ),


            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.blue,
                //ボタンの文字の色
                foregroundColor: Colors.white,
              ),
              onPressed: () {
                next(_controller.text);
                //入力値がint型に変換できないときダイアログ出現
              //   if(parseValue == null){
              //     showDialog<void>(
              //       context: context,
              //       builder: (_){
              //         return AlertDialog( 
              //           title: Text("入力が間違っています"),
              //           content: Text("数字を入力してください"),
              //           actions: <Widget>[
              //             FloatingActionButton(
              //               child: Text("はい"),
              //               onPressed: () {
              //                 Navigator.of(context).pop();
              //               }
                            
              //             )
              //           ],
              //         );
              //       }
              //     );
              //   }else{
              //   //nullじゃなかったら(数字に変換できれば)次のページに遷移
              //   Navigator.push(
              //     context,
              //     MaterialPageRoute(builder: (context) => NextPage(nextValue)),
              //   );
              // }
            
              },
              child: Text("次へ"),
              ),
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: const Icon(Icons.add),
      // ),
    );
  }
}
