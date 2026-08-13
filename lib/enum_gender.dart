//ラジオボタンの性別の型
enum Gender {
  male("男性"),
  female("女性"),
  other("その他");

  final String genderLabel;

  const Gender(this.genderLabel);

  static final Map<String, Gender> _map = {
    for (final gender in Gender.values) gender.genderLabel: gender,
  };

  static Gender? getGenderFromString(String value) {
    return _map[value];
  }

  // String getMessage() {
  //   return switch(this){
  //     .male => "男性",
  //     .female => "女性",
  //     .other => "その他",
  //   };
  // }
}
