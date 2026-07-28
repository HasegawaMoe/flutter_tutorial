import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
import 'package:flutter_tutorial/next_page.dart';
import 'enum_gender.dart';

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
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

void change() {
  {}
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  //ドラムロールのコントローラー
  final TextEditingController _controller = TextEditingController();
  //名前入力フォームのコントローラー
  final TextEditingController _nController = TextEditingController();

  // int nextValue = 0;
  // num? parseValue;
  // int radioValue = 0;

  String? name = "none";
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
            onTap: () {
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
              children: pickerItems,
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Form(
          key: _formKey,

          child: Column(
            mainAxisAlignment: .center,
            children: <Widget>[
              //名前入力フォーム
              SizedBox(
                width: 300,
                child: Column(
                  //すべての子要素がcolumnの幅に合わせて広がる
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text("氏名", textAlign: TextAlign.left),
                    // Form(
                    // child:
                    TextFormField(
                      controller: _nController,
                      validator: (value) {
                        AutovalidateMode.always;
                        if (value == null || value.isEmpty) {
                          return "名前を入力してください";
                        }
                        return null;
                      },

                      textAlign: TextAlign.center,
                      // controller: _controller,
                      decoration: InputDecoration(
                        floatingLabelStyle: TextStyle(fontSize: 12.0),
                        hintText: "山田 太郎",
                        hintStyle: TextStyle(
                          //ヒントテキストの透明度を変更
                          color: Colors.grey.withValues(alpha: 0.7),
                        ),
                      ),
                    ),
                    // ),
                    // ),
                  ],
                ),
              ),

              SizedBox(height: 40),

              //性別のラジオボタン
              SizedBox(
                width: 300,
                child: FormField<Gender>(
                  validator: (gender) {
                    if (gender == null) {
                      return "性別を選択してください";
                    }
                    return null;
                  },
                  builder: (state) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text("性別", textAlign: TextAlign.left),

                        // Text(select.errorText ?? ""));
                        RadioGroup<Gender>(
                          groupValue: state.value,
                          onChanged: (value) {
                            state.didChange(value);
                            setState(() {
                              gender = value;
                              // print(gender);
                            });
                          },
                          child: Padding(
                            //Rowの両サイドの空間
                            padding: EdgeInsets.symmetric(horizontal: 30),
                            child: Wrap(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: RadioListTile<Gender>(
                                        horizontalTitleGap: 0,
                                        contentPadding: EdgeInsets.zero,
                                        value: Gender.male,
                                        title: Text(
                                          Gender.male.getMessage(),
                                          // "男性",
                                          style: TextStyle(fontSize: 12.0),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: RadioListTile<Gender>(
                                        horizontalTitleGap: 0,
                                        contentPadding: EdgeInsets.zero,
                                        value: Gender.female,
                                        title: Text(
                                          Gender.female.getMessage(),
                                          // "女性",
                                          style: TextStyle(fontSize: 12.0),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: RadioListTile<Gender>(
                                        horizontalTitleGap: 0,
                                        contentPadding: EdgeInsets.zero,
                                        value: Gender.other,
                                        title: Text(
                                          Gender.other.getMessage(),
                                          // "その他",
                                          style: TextStyle(fontSize: 12.0),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        if (state.hasError)
                          Text(
                            state.errorText ?? "",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              //バリデーションの色を他のバリデーションの赤色と揃える
                              color: Theme.of(context).colorScheme.error,
                              fontSize: 12.0,
                            ),
                          ),
                      ],
                    );
                  },
                ),
              ),

              SizedBox(height: 40),

              //出身地のドラムロールピッカー
              SizedBox(
                width: 300,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text("出身地"),
                    // Form(
                    // key: _formKey,
                    // child:
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "選択は必須です";
                        }
                        return null;
                      },
                      decoration: InputDecoration(hintText: "選択してください"),
                      readOnly: true,
                      textAlign: TextAlign.center,
                      controller: _controller,
                      onTap: () {
                        showPicker();
                      },
                    ),
                    // ),
                  ],
                ),
              ),

              SizedBox(height: 40),

              TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.blue,
                  //ボタンの文字の色
                  foregroundColor: Colors.white,
                ),
                onPressed: () {
                  //GlobalKeyを渡したところの、現在の状態（nullなし）でバリデーションを実行して、全てエラーが返ってこなければtrue
                  if (_formKey.currentState!.validate()) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NextPage(
                          nameNext: _nController.text,
                          genderNext: gender,
                          birthPlaceNext: _controller.text,
                        ),
                      ),
                    );
                  }
                },
                child: Text("次へ"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
