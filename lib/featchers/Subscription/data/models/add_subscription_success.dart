// To parse this JSON data, do
//
//     final addSubscriptionSeccess = addSubscriptionSeccessFromJson(jsonString);

import 'dart:convert';

AddSubscriptionSeccess addSubscriptionSeccessFromJson(String str) =>
    AddSubscriptionSeccess.fromJson(json.decode(str));

String addSubscriptionSeccessToJson(AddSubscriptionSeccess data) =>
    json.encode(data.toJson());

class AddSubscriptionSeccess {
  String status;
  String message;
  ListClass list;
  int code;

  AddSubscriptionSeccess({
    required this.status,
    required this.message,
    required this.list,
    required this.code,
  });

  factory AddSubscriptionSeccess.fromJson(Map<String, dynamic> json) =>
      AddSubscriptionSeccess(
        status: json["Status"],
        message: json["Message"],
        list: ListClass.fromJson(json["List"]),
        code: json["Code"],
      );

  Map<String, dynamic> toJson() => {
        "Status": status,
        "Message": message,
        "List": list.toJson(),
        "Code": code,
      };
}

class ListClass {
  String subscriptionId;
  DateTime date;
  int userId;
  int id;

  ListClass({
    required this.subscriptionId,
    required this.date,
    required this.userId,
    required this.id,
  });

  factory ListClass.fromJson(Map<String, dynamic> json) => ListClass(
        subscriptionId: json["subscription_id"],
        date: DateTime.parse(json["date"]),
        userId: json["user_id"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "subscription_id": subscriptionId,
        "date":
            "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "user_id": userId,
        "id": id,
      };
}
