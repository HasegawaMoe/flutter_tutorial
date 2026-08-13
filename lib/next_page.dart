import 'package:flutter/material.dart';
import 'package:flutter_tutorial/main.dart';
import 'enum_gender.dart';

class NextPage extends StatelessWidget {
  NextPage({this.nameNext, this.genderNext, this.birthPlaceNext});
  String? nameNext;
  Gender? genderNext;
  String? birthPlaceNext;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("登録完了", style: TextStyle(color: Colors.white)),
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
      ),
      body: Center(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(width: 300, height: 200),
            SizedBox(
              width: 300,
              child: Text('以下の内容で登録しました。', style: TextStyle(fontSize: 20.0)),
            ),
            SizedBox(width: 300, height: 50),
            SizedBox(
              width: 300,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15.0),
                    child: Text(
                      '名前： $nameNext',
                      // style: TextStyle(fontSize: 18.0),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15.0),
                    child: Text(
                      '性別： ${genderNext!.genderLabel}',
                      // style: TextStyle(fontSize: 18.0),
                    ),
                  ),
                  Text(
                    '出身地： $birthPlaceNext',
                    // style: TextStyle(fontSize: 18.0),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
    // TODO: implement build
  }
}
