import 'errors.dart';

class SendOtpFailModel {
  String? message;
  Errors? errors;

  SendOtpFailModel({this.message, this.errors});

  factory SendOtpFailModel.fromJson(Map<String, dynamic> json) =>
      SendOtpFailModel(
        message: json['message'] as String?,
        errors: json['errors'] == null
            ? null
            : Errors.fromJson(json['errors'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'message': message,
        'errors': errors?.toJson(),
      };
}
