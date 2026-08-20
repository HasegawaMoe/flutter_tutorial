import 'package:flutter/material.dart';
import 'package:flutter_tutorial/part_enum.dart';
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
  List<GroupModel> groupList = [
    GroupModel(
      groupName: "Mrs. GREEN APPLE",
      image: "assets/images/Mrs.GREENAPPLE.jpeg",
      formation: 2013,
      members: [
        Member(
          memberName: "大森元貴",
          memberAge: 29,
          memberPart: [PartEnum.vocal, PartEnum.guitar],
        ),
        Member(
          memberName: "藤澤涼架",
          memberAge: 33,
          memberPart: [PartEnum.keyboard],
        ),
        Member(
          memberName: "若井滉斗",
          memberAge: 29,
          memberPart: [PartEnum.guitar],
        ),
      ],
    ),

    GroupModel(
      groupName: "King Gnu",
      image: "assets/images/KingGnu.jpeg",
      formation: 2017,
      members: [
        Member(
          memberName: "井口理",
          memberAge: 32,
          memberPart: [PartEnum.vocal, PartEnum.keyboard],
        ),
        Member(
          memberName: "常田大希",
          memberAge: 34,
          memberPart: [PartEnum.guitar, PartEnum.vocal],
        ),
        Member(
          memberName: "新井和輝",
          memberAge: 33,
          memberPart: [PartEnum.bassGuitar],
        ),
        Member(memberName: "勢喜遊", memberAge: 33, memberPart: [PartEnum.drum]),
      ],
    ),

    GroupModel(
      groupName: "Official髭男dism",
      image: "assets/images/Official髭男dism.jpg",
      formation: 2012,
      members: [
        Member(
          memberName: "藤原聡",
          memberAge: 34,
          memberPart: [PartEnum.vocal, PartEnum.keyboard],
        ),
        Member(
          memberName: "小笹大輔",
          memberAge: 32,
          memberPart: [PartEnum.guitar],
        ),
        Member(
          memberName: "楢﨑誠",
          memberAge: 37,
          memberPart: [PartEnum.bassGuitar, PartEnum.sax],
        ),
        Member(memberName: "松浦匡希", memberAge: 33, memberPart: [PartEnum.drum]),
      ],
    ),
  ];

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

          child: ListView.builder(
            physics: ClampingScrollPhysics(),
            itemCount: groupList.length,
            itemBuilder: (context, int index) {
              return GestureDetector(
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
                        Expanded(
                          child: Text(
                            groupList[index].groupName!,
                            // style: TextStyle(fontSize: 100),
                          ),
                        ),
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
                          NextPageDetails(groupDetails: groupList[index]),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
