import 'account.dart';
import 'user.dart';

class EditProfileModel {
  String? status;
  String? message;
  Account? account;
  User? user;
  int? code;

  EditProfileModel({
    this.status,
    this.message,
    this.account,
    this.user,
    this.code,
  });

  factory EditProfileModel.fromJson(Map<String, dynamic> json) {
    return EditProfileModel(
      status: json['Status'] as String?,
      message: json['Message'] as String?,
      account: json['account'] == null
          ? null
          : Account.fromJson(json['account'] as Map<String, dynamic>),
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      code: json['Code'] as int?,
    );
  }

  Map<String, dynamic> toJson() => {
        'Status': status,
        'Message': message,
        'account': account?.toJson(),
        'user': user?.toJson(),
        'Code': code,
      };
}
