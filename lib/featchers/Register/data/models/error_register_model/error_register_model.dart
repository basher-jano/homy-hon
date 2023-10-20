import 'message.dart';

class ErrorRegisterModel {
  String? status;
  Message? message;
  dynamic list;
  int? code;

  ErrorRegisterModel({this.status, this.message, this.list, this.code});

  factory ErrorRegisterModel.fromJson(Map<String, dynamic> json) {
    return ErrorRegisterModel(
      status: json['Status'] as String?,
      message: json['Message'] == null
          ? null
          : Message.fromJson(json['Message'] as Map<dynamic, dynamic>),
      list: json['List'] as dynamic,
      code: json['Code'] as int?,
    );
  }

  Map<String, dynamic> toJson() => {
        'Status': status,
        'Message': message?.toJson(),
        'List': list,
        'Code': code,
      };
}
