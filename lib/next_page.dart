import 'package:flutter/material.dart';
import 'package:flutter_tutorial/main.dart';
import 'enum_gender.dart';

class NextPage extends StatelessWidget{
  NextPage({this.nameNext, this.genderNext, this.birthPlaceNext});
  String? nameNext;
  Gender? genderNext;
  String? birthPlaceNext;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
      ),
      body: Center(
        child: Text(
          'はじめまして！\n$nameNextさん\nあなたの性別は${genderNext!.getMessage()}\nご出身は$birthPlaceNext\nですね！\nよろしくお願いします！',
          textAlign: TextAlign.center)),
    );
    // TODO: implement build
  }
}