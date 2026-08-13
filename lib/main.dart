import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
import 'package:flutter_tutorial/next_page.dart';
import 'enum_gender.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
      home: const MyHomePage(title: 'Bands'),
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Center(
          child: Text(widget.title, style: TextStyle(color: Colors.white)),
        ),
      ),
      body: Center(
        child: SizedBox(
          width: 380,

          child: ListView(
            children: [
              GestureDetector(
                child: Card(
                  margin: EdgeInsets.symmetric(vertical: 10.0),
                  //cardの四隅の丸さをゼロにする（カードの形を四角にする）
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(35.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [Text("Band01"), Text("＞")],
                    ),
                  ),
                ),
                onTap: () {
                  Navigator.push(context, route);
                },
              ),

              Card(
                margin: EdgeInsets.symmetric(vertical: 10.0),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
                child: Padding(
                  padding: const EdgeInsets.all(35.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Text("Band02"), Text("＞")],
                  ),
                ),
              ),

              Card(
                margin: EdgeInsets.symmetric(vertical: 10.0),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
                child: Padding(
                  padding: const EdgeInsets.all(35.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Text("Band03"), Text("＞")],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
