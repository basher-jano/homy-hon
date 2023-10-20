// To parse this JSON data, do
//
//     final contracts = contractsFromJson(jsonString);

import 'dart:convert';

Contracts contractsFromJson(String str) => Contracts.fromJson(json.decode(str));

String contractsToJson(Contracts data) => json.encode(data.toJson());

class Contracts {
  String status;
  String message;
  List<ListElement> list;
  int code;
  Pagination pagination;

  Contracts({
    required this.status,
    required this.message,
    required this.list,
    required this.code,
    required this.pagination,
  });

  factory Contracts.fromJson(Map<String, dynamic> json) => Contracts(
        status: json["Status"],
        message: json["Message"],
        list: List<ListElement>.from(
            json["List"].map((x) => ListElement.fromJson(x))),
        code: json["Code"],
        pagination: Pagination.fromJson(json["Pagination"]),
      );

  Map<String, dynamic> toJson() => {
        "Status": status,
        "Message": message,
        "List": List<dynamic>.from(list.map((x) => x.toJson())),
        "Code": code,
        "Pagination": pagination.toJson(),
      };
}

class ListElement {
  int id;
  int propertyId;
  String nameFirstParty;
  int phoneNumberFp;
  int ratio;
  dynamic acceptRefuse;

  ListElement({
    required this.id,
    required this.propertyId,
    required this.nameFirstParty,
    required this.phoneNumberFp,
    required this.ratio,
    required this.acceptRefuse,
  });

  factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
        id: json["id"],
        propertyId: json["property_id"],
        nameFirstParty: json["name_first_party"],
        phoneNumberFp: json["phone_number_FP"],
        ratio: json["ratio"],
        acceptRefuse: json["accept_refuse"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "property_id": propertyId,
        "name_first_party": nameFirstParty,
        "phone_number_FP": phoneNumberFp,
        "ratio": ratio,
        "accept_refuse": acceptRefuse,
      };
}

class Pagination {
  int totalPages;
  int currentPage;
  dynamic nextPageUrl;
  dynamic prevPageUrl;

  Pagination({
    required this.totalPages,
    required this.currentPage,
    required this.nextPageUrl,
    required this.prevPageUrl,
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
