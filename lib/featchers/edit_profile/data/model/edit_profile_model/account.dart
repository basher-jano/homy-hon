import 'img.dart';

class Account {
  int? id;
  String? firstName;
  String? lastName;
  String? email;
  dynamic? phoneNumber;
  int? blocked;
  DateTime? createdAt;
  DateTime? updatedAt;
  Img? img;

  Account({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.phoneNumber,
    this.blocked,
    this.createdAt,
    this.updatedAt,
    this.img,
  });

  factory Account.fromJson(Map<String, dynamic> json) => Account(
        id: json['id'] as int?,
        firstName: json['firstName'] as String?,
        lastName: json['lastName'] as String?,
        email: json['email'] as String?,
        phoneNumber: json['phoneNumber'] as dynamic?,
        blocked: json['blocked'] as int?,
        createdAt: json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at'] as String),
        updatedAt: json['updated_at'] == null
            ? null
            : DateTime.parse(json['updated_at'] as String),
        img: json['img'] == null
            ? null
            : Img.fromJson(json['img'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'firstName': firstName,
        'lastName': lastName,
        'email': email,
        'phoneNumber': phoneNumber,
        'blocked': blocked,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
        'img': img?.toJson(),
      };
}
