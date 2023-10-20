// ignore_for_file: public_member_api_docs, sort_constructors_first
class AllNotficationResponse {
  int id;
  String description;
  String seen;
  String recivedAt;
  AllNotficationResponse({
    required this.id,
    required this.description,
    required this.seen,
    required this.recivedAt,
  });

  factory AllNotficationResponse.fromJson(Map<String, dynamic> json) {
    return AllNotficationResponse(
        id: json["id"],
        description: json["description"],
        recivedAt: json["recived_at"],
        seen: json["seen"]);
  }
  static List<AllNotficationResponse> listFromJson(List<dynamic>? json) {
    return json == null
        ? []
        : json.map((value) => AllNotficationResponse.fromJson(value)).toList();
  }
}
