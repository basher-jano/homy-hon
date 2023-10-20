class Account {
  String? firstName;
  String? lastName;
  String? email;
  String? phoneNumber;
  int? id;

  Account({
    this.firstName,
    this.lastName,
    this.email,
    this.phoneNumber,
    this.id,
  });

  factory Account.fromJson(Map<String, dynamic> json) => Account(
        firstName: json['firstName'] as String?,
        lastName: json['lastName'] as String?,
        email: json['email'] as String?,
        phoneNumber: json['phoneNumber'] as String?,
        id: json['id'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'firstName': firstName,
        'lastName': lastName,
        'email': email,
        'phoneNumber': phoneNumber,
        'id': id,
      };
}
