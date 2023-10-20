// ignore_for_file: public_member_api_docs, sort_constructors_first
class AddFarmPrams {
  double? latitude;
  double? langtude;
  String? regionId;
  List<String>? selectedPhoto = [];
  int? isRent; // 1 if true
  int? isMonthly; // 1 if true
  int? isFrunched;
  int? hasCladding;
  int? hasWaterWell;
  int? hasParking;
  int? hasStadium;
  String? price;
  String? space;
  String? floorNumber;
  String? poolDepth;
  String? poolSpace;
  String? bedRoomsNumber;
  String? bathRoomsNumber;
  String? adress;
  String? description;
  AddFarmPrams({
    this.latitude,
    this.langtude,
    this.regionId,
    this.selectedPhoto,
    this.isRent,
    this.isMonthly,
    this.isFrunched,
    this.hasCladding,
    this.hasWaterWell,
    this.hasParking,
    this.hasStadium,
    this.price,
    this.space,
    this.floorNumber,
    this.poolDepth,
    this.poolSpace,
    this.bedRoomsNumber,
    this.bathRoomsNumber,
    this.adress,
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
      "has_parking": hasParking,
      "has_water_well": hasWaterWell,
      "furnished": isFrunched,
      "has_stadium": hasStadium,
      "pool_depth": poolDepth,
      "pool_space": poolSpace,
    };
  }
}
