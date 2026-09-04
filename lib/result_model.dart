class ResultModel {
  final String? address1;
  final String? address2;
  final String? address3;
  final String? kana1;
  final String? kana2;
  final String? kana3;
  final String? prefcode;
  final String? zipcode;

  ResultModel({
    required this.address1,
    required this.address2,
    required this.address3,
    required this.kana1,
    required this.kana2,
    required this.kana3,
    required this.prefcode,
    required this.zipcode,
  });

  factory ResultModel.fromJson(Map<String, dynamic> json) {
    return ResultModel(
      address1: json['address1'],
      address2: json['address2'],
      address3: json['address3'],
      kana1: json['kana1'],
      kana2: json['kana2'],
      kana3: json['kana3'],
      prefcode: json['prefcode'],
      zipcode: json['zipcode'],
    );
  }
}
