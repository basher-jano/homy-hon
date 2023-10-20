// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

class AddPropertyPrams {
  double? latitude;
  double? langtude;
  String? regionId;
  List<String>? selectedPhoto = [];
  int? isRent; // 1 if true
  int? isMonthly; // 1 if true
  int? isFrunched;
  int? hasCladding;
  int? greenOrTabo;
  String? price;
  String? space;
  String? floorNumber;
  String? bedRoomsNumber;
  String? bathRoomsNumber;
  String? adress;
  String? description;
  AddPropertyPrams({
    this.latitude,
    this.langtude,
    this.regionId,
    this.selectedPhoto,
    this.adress,
    this.isRent,
    this.isMonthly,
    this.isFrunched,
    this.hasCladding,
    this.greenOrTabo,
    this.price,
    this.space,
    this.floorNumber,
    this.bedRoomsNumber,
    this.bathRoomsNumber,
    this.description,
  });
  Map<String, dynamic> toJson() {
    return {
      "images[]": selectedPhoto,
      "region_id": regionId,
      "status": 0,
      "has_cladding": hasCladding,
      "description": description,
      "price": price,
      "rent_sale": isRent,
      "address": adress,
      "monthly_yearly": isMonthly,
      "space": space,
      "longitude": langtude,
      "latitude": latitude,
      "room_number": bedRoomsNumber,
      "bathroom_number": bathRoomsNumber,
      "floor_number": floorNumber,
      "green_tabo": greenOrTabo,
      "furnished": isFrunched
    };
  }
}
