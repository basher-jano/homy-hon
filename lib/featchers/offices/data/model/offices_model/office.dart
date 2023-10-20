class Office {
  int? id;
  int? accountId;
  String? address;
  int? rating;
  String? officeName;
  int? telephone;
  String? regionName;
  String? governorateName;
  String? firstImage;
  String? firstName;
  String? lastName;
  String? email;
  int? phoneNumber;

  Office({
    this.id,
    this.accountId,
    this.address,
    this.rating,
    this.officeName,
    this.telephone,
    this.regionName,
    this.governorateName,
    this.firstImage,
    this.firstName,
    this.lastName,
    this.email,
    this.phoneNumber,
  });

  factory Office.fromJson(Map<String, dynamic> json) => Office(
        id: json['id'] as int?,
        accountId: json['account_id'] as int?,
        address: json['address'] as String?,
        rating: json['rating'] as int?,
        officeName: json['officeName'] as String?,
        telephone: json['telephone'] as int?,
        regionName: json['region_name'] as String?,
        governorateName: json['governorate_name'] as String?,
        firstImage: json['first_image'] as String?,
        firstName: json['first_name'] as String?,
        lastName: json['last_name'] as String?,
        email: json['email'] as String?,
        phoneNumber: json['phone_number'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'account_id': accountId,
        'address': address,
        'rating': rating,
        'officeName': officeName,
        'telephone': telephone,
        'region_name': regionName,
        'governorate_name': governorateName,
        'first_image': firstImage,
        'first_name': firstName,
        'last_name': lastName,
        'email': email,
        'phone_number': phoneNumber,
      };
}
