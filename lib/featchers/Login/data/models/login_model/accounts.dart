import 'user.dart';
import 'office.dart';

class Accounts {
  int? id;
  String? firstName;
  String? lastName;
  String? email;
  int? phoneNumber;
  int? blocked;
  DateTime? createdAt;
  DateTime? updatedAt;
  User? user;
  Office? office;
  dynamic admin;

  Accounts({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.phoneNumber,
    this.blocked,
    this.createdAt,
    this.updatedAt,
    this.user,
    this.office,
    this.admin,
  });

  factory Accounts.fromJson(Map<String, dynamic> json) => Accounts(
        id: json['id'] as int?,
        firstName: json['firstName'] as String?,
        lastName: json['lastName'] as String?,
        email: json['email'] as String?,
        phoneNumber: json['phoneNumber'] as int?,
        blocked: json['blocked'] as int?,
        createdAt: json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at'] as String),
        updatedAt: json['updated_at'] == null
            ? null
            : DateTime.parse(json['updated_at'] as String),
        user: json['user'] == null
            ? null
            : User.fromJson(json['user'] as Map<String, dynamic>),
        office: json['office'] == null
            ? null
            : Office.fromJson(json['office'] as Map<String, dynamic>),
        admin: json['admin'] as dynamic,
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
        'user': user?.toJson(),
        'office': office?.toJson(),
        'admin': admin,
      };
}
