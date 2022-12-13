import 'dart:convert';
import 'package:catfish/artikel/model/artikel_model.dart';
import 'package:http/http.dart' as http;
import 'package:catfish/artikel/page/artikel.dart';

Future<List<Artikel>> fetchArtikel() async {
  var url = Uri.parse('https://catfish.up.railway.app/artikel/json/');
  var response = await http.get(
    url,
    headers: {
      "Access-Control-Allow-Origin": "*",
      'Content-Type': 'application/json',
    },
  );

  // decode response to json
  var data = jsonDecode(utf8.decode(response.bodyBytes));

  // convert json to list of MyWatchlist
  List<Artikel> artikelList = [];
  for (var item in data) {
    if (item != null) {
      artikelList.add(Artikel.fromJson(item));
    }
  }

  return artikelList;
}
