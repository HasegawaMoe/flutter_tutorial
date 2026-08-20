import 'package:flutter_tutorial/part_enum.dart';

class Member {
  String? memberName;
  int? memberAge;
  List<PartEnum> memberPart;

  Member({
    required this.memberName,
    required this.memberAge,
    required this.memberPart,
  });
}
