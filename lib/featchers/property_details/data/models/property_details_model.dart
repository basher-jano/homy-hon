// To parse this JSON data, do
//
//     final property = propertyFromJson(jsonString);

import 'dart:convert';

Property propertyFromJson(String str) => Property.fromJson(json.decode(str));

String propertyToJson(Property data) => json.encode(data.toJson());

class Property {
  String status;
  String message;
  ListClass list;
  int code;

  Property({
    required this.status,
    required this.message,
    required this.list,
    required this.code,
  });

  factory Property.fromJson(Map<String, dynamic> json) => Property(
        status: json["Status"],
        message: json["Message"],
        list: ListClass.fromJson(json["List"]),
        code: json["Code"],
      );

  Map<String, dynamic> toJson() => {
        "Status": status,
        "Message": message,
        "List": list.toJson(),
        "Code": code,
      };
}

class ListClass {
  PropertyClass property;
  List<String> images;
  Location location;
  Owner owner;
  Account account;
  Details details;
  String region;
  String governorateName;

  ListClass({
    required this.property,
    required this.images,
    required this.location,
    required this.owner,
    required this.account,
    required this.details,
    required this.region,
    required this.governorateName,
  });

  factory ListClass.fromJson(Map<String, dynamic> json) => ListClass(
        property: PropertyClass.fromJson(json["property"]),
        images: List<String>.from(json["images"].map((x) => x)),
        location: Location.fromJson(json["location"]),
        owner: Owner.fromJson(json["owner"]),
        account: Account.fromJson(json["account"]),
        details: Details.fromJson(json["details"]),
        region: json["region"],
        governorateName: json["governorate_name"],
      );

  Map<String, dynamic> toJson() => {
        "property": property.toJson(),
        "images": List<dynamic>.from(images.map((x) => x)),
        "location": location.toJson(),
        "owner": owner.toJson(),
        "account": account.toJson(),
        "details": details.toJson(),
        "region": region,
        "governorate_name": governorateName,
      };
}

class Account {
  int id;
  String firstName;
  String lastName;
  String email;
  int phoneNumber;

  Account({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phoneNumber,
  });

  factory Account.fromJson(Map<String, dynamic> json) => Account(
        id: json["id"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        email: json["email"],
        phoneNumber: json["phoneNumber"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "phoneNumber": phoneNumber,
      };
}

class Details {
  int id;
  String? type;
  int? roomNumber;
  int? bathroomNumber;
  int? floorNumber;
  int? greenTabo;
  int? furnished;
  int? poolSpace;
  int? poolDepth;
  int? hasStadium;
  int? hasParking;
  int? hasWaterWell;

  Details({
    required this.id,
    this.type,
    this.roomNumber,
    this.bathroomNumber,
    this.floorNumber,
    this.greenTabo,
    this.furnished,
    this.poolSpace,
    this.hasParking,
    this.hasStadium,
    this.hasWaterWell,
    this.poolDepth,
  });

  factory Details.fromJson(Map<String, dynamic> json) => Details(
        id: json["id"],
        type: json["type"],
        roomNumber: json["room_number"],
        bathroomNumber: json["bathroom_number"],
        floorNumber: json["floor_number"],
        greenTabo: json["green_tabo"],
        furnished: json["furnished"],
        hasParking: json["has_parking"],
        hasStadium: json["has_stadium"],
        hasWaterWell: json["has_water_well"],
        poolDepth: json["pool_depth"],
        poolSpace: json["pool_space"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "room_number": roomNumber,
        "bathroom_number": bathroomNumber,
        "floor_number": floorNumber,
        "green_tabo": greenTabo,
        "furnished": furnished,
      };
}

class Location {
  String longitude;
  String latitude;

  Location({
    required this.longitude,
    required this.latitude,
  });

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        longitude: json["longitude"],
        latitude: json["latitude"],
      );

  Map<String, dynamic> toJson() => {
        "longitude": longitude,
        "latitude": latitude,
      };
}

class Owner {
  int id;
  String? gender;
  String? address;
  String? description;
  int? ratting;
  String? officeName;
  int? telephone;
  String? regionOffice;
  String? governorateOffice;

  Owner(
      {required this.id,
      this.gender,
      this.address,
      this.governorateOffice,
      this.officeName,
      this.ratting,
      this.regionOffice,
      this.telephone,
      this.description});

  factory Owner.fromJson(Map<String, dynamic> json) => Owner(
        id: json["id"],
        gender: json["gender"],
        address: json["address"],
        governorateOffice: json["governorate_Office"],
        officeName: json["officeName"],
        ratting: json["rating"],
        regionOffice: json["region_Office"],
        telephone: json["telephone"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "gender": gender,
      };
}

class PropertyClass {
  int id;
  String propertyableType;
  String ownerType;
  int status;
  dynamic acceptRefuse;
  int hasCladding;
  String description;
  int price;
  int rentSale;
  String? address;
  String? monthlyYearly;
  int space;

  PropertyClass({
    required this.id,
    required this.propertyableType,
    required this.ownerType,
    required this.status,
    this.acceptRefuse,
    required this.hasCladding,
    required this.description,
    required this.price,
    required this.rentSale,
    this.address,
    this.monthlyYearly,
    required this.space,
  });

  factory PropertyClass.fromJson(Map<String, dynamic> json) => PropertyClass(
        id: json["id"],
        propertyableType: json["propertyable_type"],
        ownerType: json["owner_type"],
        status: json["status"],
        acceptRefuse: json["accept_refuse"],
        hasCladding: json["has_cladding"],
        description: json["description"],
        price: json["price"],
        rentSale: json["rent_sale"],
        address: json["address"],
        monthlyYearly: json["monthly_yearly"],
        space: json["space"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "propertyable_type": propertyableType,
        "owner_type": ownerType,
        "status": status,
        "accept_refuse": acceptRefuse,
        "has_cladding": hasCladding,
        "description": description,
        "price": price,
        "rent_sale": rentSale,
        "address": address,
        "monthly_yearly": monthlyYearly,
        "space": space,
      };
}
