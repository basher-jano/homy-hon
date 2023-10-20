class Account {
  String? firstName;
  String? lastName;
  String? email;
  int? phoneNumber;
  bool? blocked;

  Account({
    this.firstName,
    this.lastName,
    this.email,
    this.phoneNumber,
    this.blocked,
  });

  factory Account.fromJson(Map<String, dynamic> json) => Account(
        firstName: json['firstName'] as String?,
        lastName: json['lastName'] as String?,
        email: json['email'] as String?,
        phoneNumber: json['phoneNumber'] as int?,
        blocked: json['blocked'] as bool?,
      );

  Map<String, dynamic> toJson() => {
        'firstName': firstName,
        'lastName': lastName,
        'email': email,
        'phoneNumber': phoneNumber,
        'blocked': blocked,
      };
}
