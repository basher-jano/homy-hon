import 'account.dart';

class RegisterModel {
  String? status;
  String? message;
  int? code;
  Account? account;
  String? token;

  RegisterModel({
    this.status,
    this.message,
    this.code,
    this.account,
    this.token,
  });

  factory RegisterModel.fromJson(Map<String, dynamic> json) => RegisterModel(
        status: json['Status'] as String?,
        message: json['Message'] as String?,
        code: json['Code'] as int?,
        account: json['account'] == null
            ? null
            : Account.fromJson(json['account'] as Map<String, dynamic>),
        token: json['token'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'Status': status,
        'Message': message,
        'Code': code,
        'account': account?.toJson(),
        'token': token,
      };
}
