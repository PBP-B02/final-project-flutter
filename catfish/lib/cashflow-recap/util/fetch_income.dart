import 'package:catfish/cashflow-recap/model/income_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<List<MyIncome>> fetchMyIncome() async {
  var url = Uri.parse('https://catfish.up.railway.app/cashflow/json/income/');
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
  List<MyIncome> listMyIncome = [];
  for (var d in data) {
    if (d != null) {
      listMyIncome.add(MyIncome.fromJson(d));
    }
  }

  return listMyIncome;
}
