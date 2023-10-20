// To parse this JSON data, do
//
//     final addComment = addCommentFromJson(jsonString);

import 'dart:convert';

AddComment addCommentFromJson(String str) =>
    AddComment.fromJson(json.decode(str));

String addCommentToJson(AddComment data) => json.encode(data.toJson());

class AddComment {
  String status;
  String message;
  ListClass list;
  int code;

  AddComment({
    required this.status,
    required this.message,
    required this.list,
    required this.code,
  });

  factory AddComment.fromJson(Map<String, dynamic> json) => AddComment(
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
  String content;
  int accountId;
  int propertyId;
  int id;

  ListClass({
    required this.content,
    required this.accountId,
    required this.propertyId,
    required this.id,
  });

  factory ListClass.fromJson(Map<String, dynamic> json) => ListClass(
        content: json["content"],
        accountId: json["account_id"],
        propertyId: json["property_id"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "content": content,
        "account_id": accountId,
        "property_id": propertyId,
        "id": id,
      };
}
