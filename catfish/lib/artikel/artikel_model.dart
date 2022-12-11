// To parse this JSON data, do
//
//     final myArtikel = myArtikelFromJson(jsonString);

import 'dart:convert';

List<MyArtikel> myArtikelFromJson(String str) =>
    List<MyArtikel>.from(json.decode(str).map((x) => MyArtikel.fromJson(x)));

String myArtikelToJson(List<MyArtikel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MyArtikel {
  MyArtikel({
    required this.model,
    required this.pk,
    required this.fields,
  });

  String model;
  int pk;
  Fields fields;

  factory MyArtikel.fromJson(Map<String, dynamic> json) => MyArtikel(
        model: json["model"],
        pk: json["pk"],
        fields: Fields.fromJson(json["fields"]),
      );

  Map<String, dynamic> toJson() => {
        "model": model,
        "pk": pk,
        "fields": fields.toJson(),
      };
}

class Fields {
  Fields({
    required this.judul,
    required this.tanggal,
    required this.konten,
  });

  String judul;
  DateTime tanggal;
  String konten;

  factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        judul: json["judul"],
        tanggal: DateTime.parse(json["tanggal"]),
        konten: json["konten"],
      );

  Map<String, dynamic> toJson() => {
        "judul": judul,
        "tanggal": tanggal.toIso8601String(),
        "konten": konten,
      };
}
