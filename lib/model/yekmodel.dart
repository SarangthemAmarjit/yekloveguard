import 'dart:convert';

YekModel yekModelFromJson(String str) =>
    YekModel.fromJson(json.decode(str));

String yekModelToJson(YekModel data) =>
    json.encode(data.toJson());

class YekModel {
  Map<String, List<String>> yek;

  YekModel({
    required this.yek,
  });

  factory YekModel.fromJson(Map<String, dynamic> json) =>
      YekModel(
        yek: json.map(
          (key, value) => MapEntry(
            key,
            List<String>.from(value.map((x) => x)),
          ),
        ),
      );

  Map<String, dynamic> toJson() =>
      yek.map(
        (key, value) => MapEntry(key, List<dynamic>.from(value)),
      );
}