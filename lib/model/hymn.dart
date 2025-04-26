class Hymn {
  String title, hymn;
  int? id;
  Hymn({required this.title, required this.hymn, required this.id});

  factory Hymn.fromJson(Map<String, dynamic> json) => Hymn(
        hymn: json["hymn"],
        title: json["title"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "hymn": hymn,
        "title": title,
        "id": id,
      };
}
