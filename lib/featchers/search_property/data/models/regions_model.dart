// To parse this JSON data, do
//
//     final regions = regionsFromJson(jsonString);

import 'dart:convert';

Regions regionsFromJson(String str) => Regions.fromJson(json.decode(str));

String regionsToJson(Regions data) => json.encode(data.toJson());

class Regions {
  String status;
  String message;
  Map<String, String> list;
  int code;

  Regions({
    required this.status,
    required this.message,
    required this.list,
    required this.code,
  });

  factory Regions.fromJson(Map<String, dynamic> json) => Regions(
        status: json["Status"],
        message: json["Message"],
        list: Map.from(json["List"])
            .map((k, v) => MapEntry<String, String>(k, v)),
        code: json["Code"],
      );

  Map<String, dynamic> toJson() => {
        "Status": status,
        "Message": message,
        "List": Map.from(list).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "Code": code,
      };
}
