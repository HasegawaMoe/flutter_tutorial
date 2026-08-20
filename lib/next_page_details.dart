import 'package:flutter/material.dart';
import 'package:flutter_tutorial/part_enum.dart';
import 'package:flutter_tutorial/group_model.dart';

class NextPageDetails extends StatelessWidget {
  final GroupModel groupDetails;

  const NextPageDetails({super.key, required this.groupDetails});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(
          "${groupDetails.groupName}",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: Image.asset(groupDetails.image!, fit: BoxFit.cover),
              ),
              // Padding(
              //   padding: const EdgeInsets.only(bottom: 10.0),
              //   child: Text(groupDetails.groupName!),
              // ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: Text('Year Established: ${groupDetails.formation}'),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: Text(
                  // "${groupDetails.members.length}",
                  "Members:",
                ),
              ),

              ListView.builder(
                //スクロールができないようにする
                physics: NeverScrollableScrollPhysics(),
                //高さを要素の合計サイズに合わせる
                shrinkWrap: true,
                itemCount: groupDetails.members.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text("${groupDetails.members[index].memberName}"),
                    subtitle: Text(
                      'Age : ${groupDetails.members[index].memberAge}',
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        for (var icon in groupDetails.members[index].memberPart)
                          Image.asset(getIcon(icon), width: 30),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      // Text(groupDetails.image!),
    );
  }
}
