class Types {
  String? status;
  String? message;
  List<dynamic> list;
  int? code;

  Types({this.status, this.message, required this.list, this.code});

  factory Types.fromJson(Map<String, dynamic> json) => Types(
        status: json['Status'] as String?,
        message: json['Message'] as String?,
        list: json['List'] as List<dynamic>,
        code: json['Code'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'Status': status,
        'Message': message,
        'List': list,
        'Code': code,
      };
}
