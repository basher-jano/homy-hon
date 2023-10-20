// To parse this JSON data, do
//
//     final comments = commentsFromJson(jsonString);

import 'dart:convert';

Comments commentsFromJson(String str) => Comments.fromJson(json.decode(str));

String commentsToJson(Comments data) => json.encode(data.toJson());

class Comments {
  String status;
  String message;
  List<ListElement> list;
  int code;

  Comments({
    required this.status,
    required this.message,
    required this.list,
    required this.code,
  });

  factory Comments.fromJson(Map<String, dynamic> json) => Comments(
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
  String content;
  String accountName;
  int accountId;
  String? accountImg;
  String postAt;

  ListElement({
    required this.id,
    required this.content,
    required this.accountName,
    required this.accountId,
    this.accountImg,
    required this.postAt,
  });

  factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
        id: json["id"],
        content: json["content"],
        accountName: json["account_name"],
        accountId: json["account_id"],
        accountImg: json["account_img"],
        postAt: json["post_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "content": content,
        "account_name": accountName,
        "account_id": accountId,
        "account_img": accountImg,
        "post_at": postAt,
      };
}
