import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_tutorial/result_model.dart';

class ResponseModel {
  final int? status;
  final String? message;
  final List<ResultModel>? results;

  ResponseModel({
    required this.status,
    required this.message,
    required this.results,
  });

  factory ResponseModel.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      // jsonデータ自体はMap型で、キーにresultsを持つ値をrsjに入れていることになる
      // →つまりリスト型(子要素にはMapを持つ)が入る
      // ※rsjの型を指定しないとdynamic型になってしまい、後のaddressもdynamic型となる
      // →Listの型指定が必要になる
      final List rsj = json['results'];
      // rsjの中身をResultModelに変換する
      final address = rsj.map((a) {
        return ResultModel.fromJson(a);
      }).toList();

      return ResponseModel(
        status: json['status'],
        message: json['message'],
        //resultsキーの型とaddressの型が合う
        results: address,
      );
    } else {
      return ResponseModel(
        status: json['status'],
        message: json['message'],
        results: null,
      );
    }
  }

  // -----------まとめて書く場合----------

  // factory ResponseModel.fromJson(Map<String, dynamic> json) {
  //   final address = json['results'] != null
  //       //jsonのresultsの値がnullでないとき、resultsの１住所ずつ（resultsListの子要素）をresultModelに変換してそれらをListにする
  //       //json[results]をList<dynamic>型で扱うことを明記する
  //       ? (json['results'] as List)
  //             //ここでResultModel型のListにする
  //             .map((resultJson) => ResultModel.fromJson(resultJson))
  //             .toList()
  //       //Jsonのresultsの値がnullのとき、nullを返す
  //       : null;

  // return ResponseModel(
  //   status: json['status'],
  //   message: json['message'],
  //   //resultsキーの型とaddressの型が合う
  //   results: address,
  // );
  // }
}
