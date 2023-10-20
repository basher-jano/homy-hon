// To parse this JSON data, do
//
//     final properties = propertiesFromJson(jsonString);

import 'dart:convert';

MyProperties propertiesFromJson(String str) =>
    MyProperties.fromJson(json.decode(str));

String propertiesToJson(MyProperties data) => json.encode(data.toJson());

class MyProperties {
  String status;
  String message;
  List<ListElement> list;
  int code;
  Pagination? pagination;

  MyProperties({
    required this.status,
    required this.message,
    required this.list,
    required this.code,
    // required this.pagination,
  });

  factory MyProperties.fromJson(Map<String, dynamic> json) => MyProperties(
        status: json["Status"],
        message: json["Message"],
        list: List<ListElement>.from(
            json["List"].map((x) => ListElement.fromJson(x))),
        code: json["Code"],
        // pagination: Pagination.fromJson(json["Pagination"]),
      );

  Map<String, dynamic> toJson() => {
        "Status": status,
        "Message": message,
        "List": List<dynamic>.from(list.map((x) => x.toJson())),
        "Code": code,
        // "Pagination": pagination!.toJson(),
      };
}

class ListElement {
  int id;
  int price;
  String propertyableType;
  String rentSale;
  String regionName;
  String governorateName;
  String? firstImage;
  String? secondImage;
  String? thirdImage;
  dynamic forthImage;
  dynamic fifthImage;

  ListElement({
    required this.id,
    required this.price,
    required this.propertyableType,
    required this.rentSale,
    required this.regionName,
    required this.governorateName,
    this.firstImage,
    this.secondImage,
    this.thirdImage,
    this.forthImage,
    this.fifthImage,
  });

  factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
        id: json["id"],
        price: json["price"],
        propertyableType: json["propertyable_type"],
        rentSale: json["rent_sale"],
        regionName: json["region_name"],
        governorateName: json["governorate_name"],
        firstImage: json["first_image"],
        secondImage: json["second_image"],
        thirdImage: json["third_image"],
        forthImage: json["forth_image"],
        fifthImage: json["fifth_image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "price": price,
        "propertyable_type": propertyableType,
        "rent_sale": rentSale,
        "region_name": regionName,
        "governorate_name": governorateName,
        "first_image": firstImage,
        "second_image": secondImage,
        "third_image": thirdImage,
        "forth_image": forthImage,
        "fifth_image": fifthImage,
      };
}

class Pagination {
  int totalPages;
  int currentPage;
  String? nextPageUrl;
  String? prevPageUrl;

  Pagination({
    required this.totalPages,
    required this.currentPage,
    required this.nextPageUrl,
    this.prevPageUrl,
  });

  factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
        totalPages: json["total_pages"],
        currentPage: json["current_page"],
        nextPageUrl: json["next_page_url"],
        prevPageUrl: json["prev_page_url"],
      );

  Map<String, dynamic> toJson() => {
        "total_pages": totalPages,
        "current_page": currentPage,
        "next_page_url": nextPageUrl,
        "prev_page_url": prevPageUrl,
      };
}
