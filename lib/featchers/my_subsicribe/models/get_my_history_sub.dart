// ignore_for_file: public_member_api_docs, sort_constructors_first
class MyHistorySub {
  String name;
  String peroid;
  String endIn;
  MyHistorySub({
    required this.name,
    required this.peroid,
    required this.endIn,
  });
  factory MyHistorySub.fromJson(Map<String, dynamic> json) {
    return MyHistorySub(
        name: json["name"], peroid: json["period"], endIn: json["end in"]);
  }

  static List<MyHistorySub> listFromJson(List<dynamic>? json){
    return json ==null?[]:
    
     json.map((value) => MyHistorySub.fromJson(value)).toList();
  }
}
