class SendOtpModle {
  String? message;
  int? code;
  int? Code;

  SendOtpModle({this.message, this.code, this.Code});

  factory SendOtpModle.fromJson(Map<String, dynamic> json) => SendOtpModle(
        message: json['message'] as String?,
        code: json['code'] as int?,
        Code: json['Code'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'message': message,
        'code': code,
        'Code': code,
      };
}
