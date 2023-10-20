class User {
  int? id;
  int? accountId;
  dynamic gender;
  dynamic birthdate;
  dynamic createdAt;
  dynamic updatedAt;

  User({
    this.id,
    this.accountId,
    this.gender,
    this.birthdate,
    this.createdAt,
    this.updatedAt,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json['id'] as int?,
        accountId: json['account_id'] as int?,
        gender: json['gender'] as dynamic,
        birthdate: json['birthdate'] as dynamic,
        createdAt: json['created_at'] as dynamic,
        updatedAt: json['updated_at'] as dynamic,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'account_id': accountId,
        'gender': gender,
        'birthdate': birthdate,
        'created_at': createdAt,
        'updated_at': updatedAt,
      };
}
