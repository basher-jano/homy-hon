class Img {
  int? id;
  int? imgableId;
  String? imgableType;
  String? path;
  dynamic createdAt;
  dynamic updatedAt;

  Img({
    this.id,
    this.imgableId,
    this.imgableType,
    this.path,
    this.createdAt,
    this.updatedAt,
  });

  factory Img.fromJson(Map<String, dynamic> json) => Img(
        id: json['id'] as int?,
        imgableId: json['imgable_id'] as int?,
        imgableType: json['imgable_type'] as String?,
        path: json['path'] as String?,
        createdAt: json['created_at'] as dynamic,
        updatedAt: json['updated_at'] as dynamic,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'imgable_id': imgableId,
        'imgable_type': imgableType,
        'path': path,
        'created_at': createdAt,
        'updated_at': updatedAt,
      };
}
