import 'accounts.dart';

class LoginModel {
  String? status;
  String? message;
  int? code;
  Accounts? accounts;
  String? token;
  String? log;

  LoginModel({
    this.status,
    this.message,
    this.code,
    this.accounts,
    this.token,
    this.log,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        status: json['Status'] as String?,
        message: json['Message'] as String?,
        code: json['Code'] as int?,
        accounts: json['accounts'] == null
            ? null
            : Accounts.fromJson(json['accounts'] as Map<String, dynamic>),
        token: json['token'] as String?,
        log: json['log'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'status': status,
        'message': message,
        'Code': code,
        'accounts': accounts?.toJson(),
        'token': token,
        'log': log,
      };
}
