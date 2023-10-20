class Errors {
  List<dynamic> email;

  Errors({required this.email});

  factory Errors.fromJson(Map<String, dynamic> json) => Errors(
        email: json['email'] as List<dynamic>,
      );

  Map<String, dynamic> toJson() => {
        'email': email,
      };
}
