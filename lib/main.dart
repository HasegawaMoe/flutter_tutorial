import 'package:flutter/material.dart';
import 'package:flutter_tutorial/enum_part.dart';
import 'package:flutter_tutorial/group_model.dart';
import 'package:flutter_tutorial/member_model.dart';
import 'package:flutter_tutorial/next_page_details.dart';

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
  Group mrsGreenApple = Group(
    groupName: "Mrs. GREEN APPLE",
    image: "assets/images/Mrs.GREENAPPLE.jpeg",
    formation: 2013,
    members: [
      Member(
        memberName: "大森元貴",
        memberAge: 29,
        memberPart: [Part.vocal, Part.guitar],
      ),
      Member(memberName: "藤澤涼架", memberAge: 33, memberPart: [Part.keyboard]),
      Member(memberName: "若井滉斗", memberAge: 29, memberPart: [Part.guitar]),
    ],
  );

  Group kingGnu = Group(
    groupName: "King Gnu",
    image: "assets/images/KingGnu.jpeg",
    formation: 2017,
    members: [
      Member(
        memberName: "井口理",
        memberAge: 32,
        memberPart: [Part.vocal, Part.keyboard],
      ),
      Member(
        memberName: "常田大希",
        memberAge: 34,
        memberPart: [Part.guitar, Part.vocal],
      ),
      Member(memberName: "新井和輝", memberAge: 33, memberPart: [Part.bassGuitar]),
      Member(memberName: "勢喜遊", memberAge: 33, memberPart: [Part.drum]),
    ],
  );

  Group officialHigedanDism = Group(
    groupName: "Official髭男dism",
    image: "assets/images/Official髭男dism.jpg",
    formation: 2012,
    members: [
      Member(
        memberName: "藤原聡",
        memberAge: 34,
        memberPart: [Part.vocal, Part.keyboard],
      ),
      Member(memberName: "小笹大輔", memberAge: 32, memberPart: [Part.guitar]),
      Member(memberName: "楢﨑誠", memberAge: 37, memberPart: [Part.bassGuitar]),
      Member(memberName: "松浦匡希", memberAge: 33, memberPart: [Part.drum]),
    ],
  );

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
                      children: [
                        Text(mrsGreenApple.groupName!),
                        Icon(
                          Icons.chevron_right,
                          color: Colors.blueAccent,
                          size: 33.0,
                        ),
                      ],
                    ),
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          NextPageDetails(groupDetails: mrsGreenApple),
                    ),
                  );
                },
              ),

              GestureDetector(
                child: Card(
                  margin: EdgeInsets.symmetric(vertical: 10.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(35.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(kingGnu.groupName!),
                        Icon(
                          Icons.chevron_right,
                          color: Colors.blueAccent,
                          size: 33.0,
                        ),
                      ],
                    ),
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          NextPageDetails(groupDetails: kingGnu),
                    ),
                  );
                },
              ),

              GestureDetector(
                child: Card(
                  margin: EdgeInsets.symmetric(vertical: 10.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(35.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(officialHigedanDism.groupName!),
                        Icon(
                          Icons.chevron_right,
                          color: Colors.blueAccent,
                          size: 33.0,
                        ),
                      ],
                    ),
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          NextPageDetails(groupDetails: officialHigedanDism),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
