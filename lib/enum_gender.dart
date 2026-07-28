//ラジオボタンの性別の型
enum Gender {
  male,
  female,
  other;

String getMessage() {
  return switch(this){
    .male => "男性",
    .female => "女性",
    .other => "その他",
  };
}


}


