import 'dart:convert';

import 'package:articlepage/model/article_model.dart';
import 'package:http/http.dart' as http;

class ArticelsApi {
  static Future<List<ArticleModel>> getArticle(String query) async {
    final url = Uri.parse("https://catfish.up.railway.app/artikel/json/");
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List articles = json.decode(response.body);

      return articles
          .map((json) => ArticleModel.fromJson(json))
          .where((article) {
        final titleLower = article.judul.toLowerCase();
        final searchLower = query.toLowerCase();

        return titleLower.contains(searchLower);
      }).toList();
    } else {
      throw Exception();
    }
  }
}
