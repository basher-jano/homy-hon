class Message {
	List<dynamic>? email;
	List<dynamic>? phoneNumber;
	List<dynamic>? password;

	Message({this.email, this.phoneNumber, this.password});

	factory Message.fromJson(Map<String, dynamic> json) => Message(
				email: json['email'] as List<dynamic>?,
				phoneNumber: json['phoneNumber'] as List<dynamic>?,
				password: json['password'] as List<dynamic>?,
			);

	Map<String, dynamic> toJson() => {
				'email': email,
				'phoneNumber': phoneNumber,
				'password': password,
			};
}
