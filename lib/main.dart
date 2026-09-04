import 'dart:convert';
import 'dart:ffi';
import 'dart:io';
import 'dart:ui';
import 'package:flutter/physics.dart';
import 'package:flutter_tutorial/response_model.dart';

import 'result_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

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
      home: const MyHomePage(title: 'Search Your Address'),
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
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _controller = TextEditingController();

  Map<String, dynamic> decodedJson = {};
  List<ResultModel> responseAddress = [];
  String? errorMessage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title, style: TextStyle(color: Colors.white)),
      ),
      body: Center(
        child: SizedBox(
          width: 300,
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Spacer(),
                TextFormField(
                  textAlign: TextAlign.center,
                  controller: _controller,
                  maxLength: 8,
                  decoration: InputDecoration(labelText: "郵便番号"),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    AutovalidateMode.always;
                    if (value == null || value.isEmpty) {
                      return "郵便番号を入力してください";
                    } else if (value.length < 7) {
                      return "郵便番号を正しく入力してください";
                    } else {
                      return null;
                    }
                  },
                ),

                SizedBox(height: 30),

                TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Future<void> getData() async {
                        var httpResponse = await http.get(
                          Uri.parse(
                            'https://zipcloud.ibsnet.co.jp/api/search?zipcode=${_controller.text}',
                          ),
                        );
                        final decodedJson = jsonDecode(httpResponse.body);
                        final fromJson = ResponseModel.fromJson(decodedJson);
                        if (fromJson.status == 200) {
                          if (fromJson.results != null) {
                            setState(() {
                              responseAddress = fromJson.results!;
                              errorMessage = null;
                            });
                          } else {
                            setState(() {
                              errorMessage = 'この郵便番号は無効です';
                            });
                          }
                        } else if (fromJson.status == 400 ||
                            fromJson.status == 500) {
                          setState(() {
                            errorMessage = fromJson.message;
                          });
                        }
                      }

                      getData();
                    }
                  },
                  child: Text("Search"),
                ),

                Expanded(
                  child: errorMessage == null
                      ? Scrollbar(
                          thumbVisibility: true,
                          child: ListView.builder(
                            itemCount: responseAddress.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Column(
                                children: [
                                  Text(
                                    '郵便番号：${responseAddress[index].zipcode}',
                                  ),
                                  Text(
                                    '住所：${responseAddress[index].address1}${responseAddress[index].address2}${responseAddress[index].address3}',
                                  ),
                                  Text(
                                    '読み方：${responseAddress[index].kana1}${responseAddress[index].kana2}${responseAddress[index].kana3}',
                                  ),
                                  SizedBox(height: 15),
                                ],
                              );
                            },
                          ),
                        )
                      : Text(
                          '$errorMessage',
                          style: TextStyle(
                            color: Color.fromARGB(255, 182, 26, 15),
                          ),
                        ),
                ),

                //---------- for in を使って繰り返す場合 -----------
                // for (var resultsList in responseAddress)
                //   Column(
                //     children: [
                //       Text('郵便番号：${resultsList.zipcode}'),
                //       Text(
                //         '住所：${resultsList.address1}${resultsList.address2}${resultsList.address3}',
                //       ),
                //       Text(
                //         '読み方${resultsList.kana1}${resultsList.kana2}${resultsList.kana3}',
                //       ),
                //       SizedBox(height: 25),
                //     ],
                //   ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
