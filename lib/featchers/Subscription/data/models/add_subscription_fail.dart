// To parse this JSON data, do
//
//     final addSubscriptionFail = addSubscriptionFailFromJson(jsonString);

import 'dart:convert';

AddSubscriptionFail addSubscriptionFailFromJson(String str) =>
    AddSubscriptionFail.fromJson(json.decode(str));

String addSubscriptionFailToJson(AddSubscriptionFail data) =>
    json.encode(data.toJson());

class AddSubscriptionFail {
  String status;
  String message;
  Subscription subscription;
  Wallet wallet;
  int code;

  AddSubscriptionFail({
    required this.status,
    required this.message,
    required this.subscription,
    required this.wallet,
    required this.code,
  });

  factory AddSubscriptionFail.fromJson(Map<String, dynamic> json) =>
      AddSubscriptionFail(
        status: json["Status"],
        message: json["Message"],
        subscription: Subscription.fromJson(json["subscription"]),
        wallet: Wallet.fromJson(json["wallet"]),
        code: json["Code"],
      );

  Map<String, dynamic> toJson() => {
        "Status": status,
        "Message": message,
        "subscription": subscription.toJson(),
        "wallet": wallet.toJson(),
        "Code": code,
      };
}

class Subscription {
  int id;
  String name;
  int price;
  int propertyNumber;
  String period;
  dynamic createdAt;
  dynamic updatedAt;

  Subscription({
    required this.id,
    required this.name,
    required this.price,
    required this.propertyNumber,
    required this.period,
    this.createdAt,
    this.updatedAt,
  });

  factory Subscription.fromJson(Map<String, dynamic> json) => Subscription(
        id: json["id"],
        name: json["name"],
        price: json["price"],
        propertyNumber: json["propertyNumber"],
        period: json["period"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "price": price,
        "propertyNumber": propertyNumber,
        "period": period,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}

class Wallet {
  int id;
  int userId;
  int amount;

  Wallet({
    required this.id,
    required this.userId,
    required this.amount,
  });

  factory Wallet.fromJson(Map<String, dynamic> json) => Wallet(
        id: json["id"],
        userId: json["user_id"],
        amount: json["amount"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "amount": amount,
      };
}
