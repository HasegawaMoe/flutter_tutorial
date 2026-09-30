import 'package:flutter/material.dart';
import 'package:flutter_tutorial/screen/bread_group_screen.dart';
import 'package:flutter_tutorial/faction_enum.dart';
import 'package:flutter_tutorial/screen/noodle_group_screen.dart';
import 'package:flutter_tutorial/screen/not_eating_group_screen.dart';
import 'package:flutter_tutorial/screen/potato_group_screen.dart';
import 'package:flutter_tutorial/screen/rice_group_screen.dart';

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
      home: const MyHomePage(title: '朝ごはんの派閥'),
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
  final List<FactionEnum> faction = FactionEnum.values;
  int? status;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title, style: TextStyle(color: Colors.white)),
      ),
      body: ListView.builder(
        itemCount: faction.length,
        itemBuilder: (context, int index) {
          return GestureDetector(
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text('${faction[index].japanese}派'),
              ),
            ),
            onTap: () {
              FactionEnum selectedFaction = faction[index];
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    switch (selectedFaction) {
                      case FactionEnum.rice:
                        return RiceGroupScreen(
                          selectedFaction: selectedFaction,
                        );
                      case FactionEnum.bread:
                        return BreadGroupScreen(
                          selectedFaction: selectedFaction,
                        );
                      case FactionEnum.noodle:
                        return NoodleGroupScreen(
                          selectedFaction: selectedFaction,
                        );
                      case FactionEnum.potato:
                        return PotatoGroupScreen(
                          selectedFaction: selectedFaction,
                        );
                      case FactionEnum.notEating:
                        return NotEatingGroupScreen(
                          selectedFaction: selectedFaction,
                        );
                    }
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
