class User {
  dynamic gender;
  dynamic birthdate;

  User({this.gender, required this.birthdate});

  factory User.fromJson(Map<String, dynamic> json) => User(
        gender: json['gender'] as dynamic,
        birthdate: json['birthdate'] as dynamic,
      );

  Map<String, dynamic> toJson() => {
        'gender': gender,
        'birthdate': birthdate,
      };
}
