class Message {
  List<dynamic>? firstName;
  List<dynamic>? lastName;
  List<dynamic>? email;
  List<dynamic>? phoneNumber;
  List<dynamic>? password;

  Message({
    this.firstName,
    this.lastName,
    this.email,
    this.phoneNumber,
    this.password,
  });

  factory Message.fromJson(Map<dynamic, dynamic> json) => Message(
        firstName: json['firstName'] as List<dynamic>?,
        lastName: json['lastName'] as List<dynamic>?,
        email: json['email'] as List<dynamic>?,
        phoneNumber: json['phoneNumber'] as List<dynamic>?,
        password: json['password'] as List<dynamic>?,
      );

  Map<String, dynamic> toJson() => {
        'firstName': firstName,
        'lastName': lastName,
        'email': email,
        'phoneNumber': phoneNumber,
        'password': password,
      };
}
