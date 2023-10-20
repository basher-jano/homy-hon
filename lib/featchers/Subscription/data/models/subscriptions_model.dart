// To parse this JSON data, do
//
//     final subscriptions = subscriptionsFromJson(jsonString);

import 'dart:convert';

Subscriptions subscriptionsFromJson(String str) =>
    Subscriptions.fromJson(json.decode(str));

String subscriptionsToJson(Subscriptions data) => json.encode(data.toJson());

class Subscriptions {
  String status;
  String message;
  List<ListElement> list;
  int code;

  Subscriptions({
    required this.status,
    required this.message,
    required this.list,
    required this.code,
  });

  factory Subscriptions.fromJson(Map<String, dynamic> json) => Subscriptions(
        status: json["Status"],
        message: json["Message"],
        list: List<ListElement>.from(
            json["List"].map((x) => ListElement.fromJson(x))),
        code: json["Code"],
      );

  Map<String, dynamic> toJson() => {
        "Status": status,
        "Message": message,
        "List": List<dynamic>.from(list.map((x) => x.toJson())),
        "Code": code,
      };
}

class ListElement {
  int id;
  String name;
  int price;
  int propertyNumber;
  String period;

  ListElement({
    required this.id,
    required this.name,
    required this.price,
    required this.propertyNumber,
    required this.period,
  });

  factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
        id: json["id"],
        name: json["name"],
        price: json["price"],
        propertyNumber: json["propertyNumber"],
        period: json["period"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "price": price,
        "propertyNumber": propertyNumber,
        "period": period,
      };
}
