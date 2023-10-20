import 'list.dart';

class ProfileModel {
  String? status;
  String? message;
  List? list;
  int? code;

  ProfileModel({this.status, this.message, this.list, this.code});

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
        status: json['Status'] as String?,
        message: json['Message'] as String?,
        list: json['List'] == null
            ? null
            : List.fromJson(json['List'] as Map<String, dynamic>),
        code: json['Code'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'Status': status,
        'Message': message,
        'List': list?.toJson(),
        'Code': code,
      };
}
