// ignore_for_file: public_member_api_docs, sort_constructors_first
class GetMySubResponse {
  String date;
  int remainingProperty;
  GetMySubResponse({
    required this.date,
    required this.remainingProperty,
  });
  factory GetMySubResponse.fromJson(Map<String, dynamic> json) {
    return GetMySubResponse(
        date: json["date"], remainingProperty: json["remainingProperty"]);
  }
}
