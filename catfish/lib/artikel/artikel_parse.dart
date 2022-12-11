import 'package:catfish/artikel/artikel_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

Future<List<MyArtikel>> fetchMyArtikel() async {
  var url = Uri.parse('https://catfish.up.railway.app/artikel/json/');
  var response = await http.get(
    url,
    headers: {
      "Access-Control-Allow-Origin": "*",
      "Content-Type": "application/json",
    },
  );

  var data = jsonDecode(utf8.decode(response.bodyBytes));

  List<MyArtikel> listArtikel = [];
  for (var d in data) {
    if (d != null) {
      listArtikel.add(MyArtikel.fromJson(d));
    }
  }

  return listArtikel;
}

void createMyArtikel(String title, String content) async {
  final response = await http
      .post(Uri.parse('https://catfish.up.railway.app/artikel/'), body: {
    'title': title,
    'content': content,
  });
}
