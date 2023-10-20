// To parse this JSON data, do
//
//     final newestAds = newestAdsFromJson(jsonString);

import 'dart:convert';

AdvertisementsModel AdvertisementsModelnewestAdsFromJson(String str) =>
    AdvertisementsModel.fromJson(json.decode(str));

String newestAdsToJson(AdvertisementsModel data) => json.encode(data.toJson());

class AdvertisementsModel {
  String status;
  String message;
  List<ListElement> list;
  int code;


  AdvertisementsModel({
    required this.status,
    required this.message,
    required this.list,
    required this.code,
 
  });

  factory AdvertisementsModel.fromJson(Map<String, dynamic> json) =>
      AdvertisementsModel(
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
  String link;
  String companyName;
  String image;
  String? description;

  ListElement({
    required this.id,
    required this.link,
    required this.companyName,
    required this.image,
    required this.description,

  });

  factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
        id: json["id"],
        link: json["link"],
        companyName: json["companyName"],
        image: json["image"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "link": link,
        "companyName": companyName,
        "image": image,
        "description": description,
      };
}
