class AddShopPrams {
  double? latitude;
  double? langtude;
  int? isFrunched;
  String? regionId;
  List<String>? selectedPhoto = [];
  int? isRent; // 1 if true
  int? isMonthly; // 1 if true
  int? hasCladding;
  String? price;
  String? space;

  String? adress;
  String? description;
  AddShopPrams({
    this.isFrunched,
    this.latitude,
    this.langtude,
    this.regionId,
    this.selectedPhoto,
    this.adress,
    this.isRent,
    this.isMonthly,
    this.hasCladding,
    this.price,
    this.space,
    this.description,
  });
  Map<String, dynamic> toJson() {
    return {
      "images[]": selectedPhoto,
      "region_id": regionId,
      "type": "shop",
      "status": 0,
      "has_cladding": hasCladding,
      "description": description,
      "furnished": isFrunched,
      "price": price,
      "rent_sale": isRent,
      "address": adress,
      "monthly_yearly": isMonthly,
      "space": space,
      "longitude": langtude,
      "latitude": latitude,
    };
  }
}
