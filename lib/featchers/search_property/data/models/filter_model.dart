class FilterModel {
  String sellOrRent = 'none';
  String type = 'none';
  String max = 'none';
  String min = 'none';
  String region = 'none';
  String governorate = 'none';
  double? latitude;
  double? langtude;
  Map<String, String> filter = new Map();

  Map<String, String> getFilter() {
    return filter;
  }

  void printFilterMap() {
    print(filter);
  }

  void createFilter() {
    filter.clear();
    if (sellOrRent == "sell") {
      filter.putIfAbsent('sell', () => "sell");
    } else if (sellOrRent == 'rent') {
      filter.putIfAbsent('rent', () => "rent");
    }
    if (type != 'none') {
      filter.putIfAbsent(type, () => type);
    }
    if (max != 'none') {
      filter.putIfAbsent('max', () => max);
    }
    if (min != 'none') {
      filter.putIfAbsent('min', () => min);
    }
    if (region != 'none') {
      filter.putIfAbsent('region', () => region);
    }
    if (governorate != 'none') {
      filter.putIfAbsent('governorate', () => governorate);
    }
    if (langtude != null) {
      filter.putIfAbsent('longitude', () => langtude.toString());
    }
    if (latitude != null) {
      filter.putIfAbsent('latitude', () => latitude.toString());
    }
    print(filter);
  }

  FilterModel({
    String? sellOrRent,
    String? type,
    String? max,
    String? min,
    String? region,
    String? governorate,
    double? latitude,
    double? langtude,
  }) {
    if (sellOrRent != null) {
      this.sellOrRent = sellOrRent;
    }
    if (type != null) {
      this.type = type;
    }
    if (max != null) {
      this.max = max;
    }
    if (min != null) {
      this.min = min;
    }
    if (region != null) {
      this.region = region;
    }
    if (governorate != null) {
      this.governorate = governorate;
    }
    createFilter();
  }
}
