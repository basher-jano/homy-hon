// To parse this JSON data, do
//
//     final officeDetailsModel = officeDetailsModelFromJson(jsonString);

import 'dart:convert';

OfficeDetailsModel officeDetailsModelFromJson(String str) =>
    OfficeDetailsModel.fromJson(json.decode(str));

String officeDetailsModelToJson(OfficeDetailsModel data) =>
    json.encode(data.toJson());

class OfficeDetailsModel {
  String status;
  String message;
  ListClass list;
  int code;

  OfficeDetailsModel({
    required this.status,
    required this.message,
    required this.list,
    required this.code,
  });

  factory OfficeDetailsModel.fromJson(Map<String, dynamic> json) =>
      OfficeDetailsModel(
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
  Account account;
  Office office;
  dynamic image;
  String regionName;
  String governorateName;
  dynamic location;

  ListClass({
    required this.account,
    required this.office,
    required this.image,
    required this.regionName,
    required this.governorateName,
    required this.location,
  });

  factory ListClass.fromJson(Map<String, dynamic> json) => ListClass(
        account: Account.fromJson(json["account"]),
        office: Office.fromJson(json["Office"]),
        image: json["image"],
        regionName: json["region name"],
        governorateName: json["governorate name"],
        location: json["location"],
      );

  Map<String, dynamic> toJson() => {
        "account": account.toJson(),
        "Office": office.toJson(),
        "image": image,
        "region name": regionName,
        "governorate name": governorateName,
        "location": location,
      };
}

class Account {
  String firstName;
  String lastName;
  String email;
  int phoneNumber;
  bool blocked;

  Account({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phoneNumber,
    required this.blocked,
  });

  factory Account.fromJson(Map<String, dynamic> json) => Account(
        firstName: json["firstName"],
        lastName: json["lastName"],
        email: json["email"],
        phoneNumber: json["phoneNumber"],
        blocked: json["blocked"],
      );

  Map<String, dynamic> toJson() => {
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "phoneNumber": phoneNumber,
        "blocked": blocked,
      };
}

class Office {
  String address;
  String? description;
  int rating;
  String officeName;
  int telephone;

  Office({
    required this.address,
    required this.description,
    required this.rating,
    required this.officeName,
    required this.telephone,
  });

  factory Office.fromJson(Map<String, dynamic> json) => Office(
        address: json["address"],
        description: json["description"],
        rating: json["rating"],
        officeName: json["officeName"],
        telephone: json["telephone"],
      );

  Map<String, dynamic> toJson() => {
        "address": address,
        "description": description,
        "rating": rating,
        "officeName": officeName,
        "telephone": telephone,
      };
}
