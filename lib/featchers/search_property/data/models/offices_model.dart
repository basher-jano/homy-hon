// To parse this JSON data, do
//
//     final offices = officesFromJson(jsonString);

import 'dart:convert';

Offices officesFromJson(String str) => Offices.fromJson(json.decode(str));

String officesToJson(Offices data) => json.encode(data.toJson());

class Offices {
  String status;
  String message;
  int code;
  List<Office> offices;

  Offices({
    required this.status,
    required this.message,
    required this.code,
    required this.offices,
  });

  factory Offices.fromJson(Map<String, dynamic> json) => Offices(
        status: json["Status"],
        message: json["Message"],
        code: json["Code"],
        offices:
            List<Office>.from(json["offices"].map((x) => Office.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "Status": status,
        "Message": message,
        "Code": code,
        "offices": List<dynamic>.from(offices.map((x) => x.toJson())),
      };
}

class Office {
  int id;
  int accountId;
  String address;
  String? description;
  int rating;
  String officeName;
  int telephone;
  String regionName;
  String governorateName;
  String? firstImage;
  String firstName;
  String lastName;
  String email;
  int phoneNumber;

  Office({
    required this.id,
    required this.accountId,
    required this.address,
    required this.description,
    required this.rating,
    required this.officeName,
    required this.telephone,
    required this.regionName,
    required this.governorateName,
    required this.firstImage,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phoneNumber,
  });

  factory Office.fromJson(Map<String, dynamic> json) => Office(
        id: json["id"],
        accountId: json["account_id"],
        address: json["address"],
        description: json["description"],
        rating: json["rating"],
        officeName: json["officeName"],
        telephone: json["telephone"],
        regionName: json["region_name"],
        governorateName: json["governorate_name"],
        firstImage: json["first_image"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        email: json["email"],
        phoneNumber: json["phone_number"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "account_id": accountId,
        "address": address,
        "description": description,
        "rating": rating,
        "officeName": officeName,
        "telephone": telephone,
        "region_name": regionName,
        "governorate_name": governorateName,
        "first_image": firstImage,
        "first_name": firstName,
        "last_name": lastName,
        "email": email,
        "phone_number": phoneNumber,
      };
}
