// To parse this JSON data, do
//
// final yekModel = yekModelFromJson(jsonString);

import 'dart:convert';

List<YekModel> yekModelFromJson(String str) =>
    List<YekModel>.from(json.decode(str).map((x) => YekModel.fromJson(x)));

String yekModelToJson(List<YekModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class YekModel {
  String yekname;
  List<String> surnames;

  YekModel({
    required this.yekname,
    required this.surnames,
  });

  factory YekModel.fromJson(Map<String, dynamic> json) => YekModel(
        yekname: json["yekname"],
        surnames: List<String>.from(json["surnames"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "yekname": yekname,
        "surnames": List<dynamic>.from(surnames.map((x) => x)),
      };
}