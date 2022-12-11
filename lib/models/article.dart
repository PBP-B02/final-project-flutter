import 'package:flutter/material.dart';

class Article {
  final int id;
  final String title;
  final String author;
  final String content;

  const Article({
    required this.id,
    required this.author,
    required this.title,
    required this.content,
  });

  // factory Article.fromJson(Map<String, dynamic> json) => Article(
  //       id: json['id'],
  //       author: json['author'],
  //       title: json['title'],
  //       content: json['content'],
  //     );

  // Map<String, dynamic> toJson() => {
  //       'id': id,
  //       'title': title,
  //       'author': author,
  //       'urlImage': content,
  //     };
}
