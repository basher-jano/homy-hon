import 'office.dart';

class OfficesModel {
  String? status;
  String? message;
  int? code;
  List<Office>? offices;

  OfficesModel({this.status, this.message, this.code, this.offices});

  factory OfficesModel.fromJson(Map<String, dynamic> json) => OfficesModel(
        status: json['Status'] as String?,
        message: json['Message'] as String?,
        code: json['Code'] as int?,
        offices: (json['offices'] as List<dynamic>?)
            ?.map((e) => Office.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'Status': status,
        'Message': message,
        'Code': code,
        'offices': offices?.map((e) => e.toJson()).toList(),
      };
}
