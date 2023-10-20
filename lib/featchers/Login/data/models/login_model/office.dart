class Office {
  int? id;
  int? regionId;
  int? accountId;
  String? address;
  String? description;
  int? rating;
  String? officeName;
  int? telephone;
   DateTime? createdAt;
   DateTime? updatedAt;

  Office(
      {this.id,
      this.regionId,
      this.accountId,
      this.address,
      this.description,
      this.rating,
      this.officeName,
      this.telephone,
      this.createdAt,
      this.updatedAt});

  Office.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    regionId = json['region_id'];
    accountId = json['account_id'];
    address = json['address'];
    description = json['description'];
    rating = json['rating'];
    officeName = json['officeName'];
    telephone = json['telephone'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['region_id'] = this.regionId;
    data['account_id'] = this.accountId;
    data['address'] = this.address;
    data['description'] = this.description;
    data['rating'] = this.rating;
    data['officeName'] = this.officeName;
    data['telephone'] = this.telephone;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
