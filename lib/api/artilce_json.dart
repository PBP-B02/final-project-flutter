import 'dart:convert';

import 'package:articlepage/models/article.dart';
import 'package:http/http.dart' as http;

class BooksApi {
  static Future<List<Article>> getArticle(String query) async {
    final url = Uri.parse("https://catfish.up.railway.app/artikel/json/");
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List articles = json.decode(response.body);

      return articles.map((json) => Article.fromJson(json)).where((book) {
        final titleLower = book.title.toLowerCase();
        final authorLower = book.author.toLowerCase();
        final searchLower = query.toLowerCase();

        return titleLower.contains(searchLower) ||
            authorLower.contains(searchLower);
      }).toList();
    } else {
      throw Exception();
    }
  }
}
