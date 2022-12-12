import 'package:flutter/material.dart';

class ArticleModel {
  String judul;
  String tanggal;
  String konten;

  ArticleModel({
    required this.judul,
    required this.tanggal,
    required this.konten,
  });

  factory ArticleModel.fromJson(Map<String, dynamic> data) => ArticleModel(
        judul: data["fields"]["judul"],
        tanggal: data["fields"]["tanggal"],
        konten: data["fields"]["konten"],
      );

  Map<String, dynamic> toJson() => {
        "judul": judul,
        "tanggal": tanggal,
      };
}
