import 'package:catfish/cashflow/model/my_spending_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<List<MySpending>> fetchMySpending() async {
  var url = Uri.parse(
      'https://catfish.up.railway.app/cashflow/json/spending/');
  var response = await http.get(
    url,
    headers: {
      "Access-Control-Allow-Origin": "*",
      "Content-Type": "application/json",
    },
  );

  // melakukan decode response menjadi bentuk json
  var data = jsonDecode(utf8.decode(response.bodyBytes));

  // melakukan konversi data json menjadi object ToDo
  List<MySpending> listMySpending = [];
  for (var d in data) {
    if (d != null) {
      listMySpending.add(MySpending.fromJson(d));
    }
  }

  return listMySpending;
}