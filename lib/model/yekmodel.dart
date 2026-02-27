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
  String meiteimayek;
  String title;

  String description;
  List<String> surnames;

  YekModel({
    required this.yekname,
    required this.meiteimayek,

    required this.title,
    required this.description,
    required this.surnames,
  });

  factory YekModel.fromJson(Map<String, dynamic> json) => YekModel(
    yekname: json["yekname"],
    meiteimayek: json["meiteimayek"],
    title: json["title"],
    description: json["description"],
    surnames: List<String>.from(json["surnames"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "yekname": yekname,
    "meiteimayek": meiteimayek,
    "title": title,
    "description": description,
    "surnames": List<dynamic>.from(surnames.map((x) => x)),
  };
}
