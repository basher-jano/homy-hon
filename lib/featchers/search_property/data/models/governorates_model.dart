// To parse this JSON data, do
//
//     final governorates = governoratesFromJson(jsonString);

import 'dart:convert';

Governorates governoratesFromJson(String str) =>
    Governorates.fromJson(json.decode(str));

String governoratesToJson(Governorates data) => json.encode(data.toJson());

class Governorates {
  String status;
  String message;
  Map<String, String> list;
  int code;

  Governorates({
    required this.status,
    required this.message,
    required this.list,
    required this.code,
  });

  factory Governorates.fromJson(Map<String, dynamic> json) => Governorates(
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
