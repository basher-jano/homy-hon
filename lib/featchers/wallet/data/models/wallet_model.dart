// To parse this JSON data, do
//
//     final wallet = walletFromJson(jsonString);

import 'dart:convert';

Wallet walletFromJson(String str) => Wallet.fromJson(json.decode(str));

String walletToJson(Wallet data) => json.encode(data.toJson());

class Wallet {
  String code;
  String status;
  String message;
  WalletClass wallet;

  Wallet({
    required this.code,
    required this.status,
    required this.message,
    required this.wallet,
  });

  factory Wallet.fromJson(Map<String, dynamic> json) => Wallet(
        code: json["code"],
        status: json["Status"],
        message: json["Message"],
        wallet: WalletClass.fromJson(json["wallet"]),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "Status": status,
        "Message": message,
        "wallet": wallet.toJson(),
      };
}

class WalletClass {
  int id;
  int userId;
  int amount;
  User user;

  WalletClass({
    required this.id,
    required this.userId,
    required this.amount,
    required this.user,
  });

  factory WalletClass.fromJson(Map<String, dynamic> json) => WalletClass(
        id: json["id"],
        userId: json["user_id"],
        amount: json["amount"],
        user: User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "amount": amount,
        "user": user.toJson(),
      };
}

class User {
  int id;
  int accountId;
  String gender;
  DateTime birthdate;
  dynamic createdAt;
  dynamic updatedAt;

  User({
    required this.id,
    required this.accountId,
    required this.gender,
    required this.birthdate,
    required this.createdAt,
    required this.updatedAt,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        accountId: json["account_id"],
        gender: json["gender"],
        birthdate: DateTime.parse(json["birthdate"]),
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "account_id": accountId,
        "gender": gender,
        "birthdate":
            "${birthdate.year.toString().padLeft(4, '0')}-${birthdate.month.toString().padLeft(2, '0')}-${birthdate.day.toString().padLeft(2, '0')}",
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}
