// To parse this JSON data, do
//
//     final defaultIndex = defaultIndexFromJson(jsonString);

import 'dart:convert';

DefaultIndex defaultIndexFromJson(String str) =>
    DefaultIndex.fromJson(json.decode(str));

String defaultIndexToJson(DefaultIndex data) => json.encode(data.toJson());

class DefaultIndex {
  List<Index> indices;

  DefaultIndex({
    required this.indices,
  });

  factory DefaultIndex.fromJson(Map<String, dynamic> json) => DefaultIndex(
        indices:
            List<Index>.from(json["indices"].map((x) => Index.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "indices": List<dynamic>.from(indices.map((x) => x.toJson())),
      };
}

class Index {
  String id;
  String title;
  String? hymn;

  Index({
    required this.id,
    required this.title,
    this.hymn,
  });

  factory Index.fromJson(Map<String, dynamic> json) => Index(
        id: json["id"],
        hymn: json["hymn"],
        title: json["title"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "hymn": hymn,
        "title": title,
      };
}
