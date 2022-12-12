import 'package:catfish/cashflow/model/my_spending_model.dart';
import 'package:flutter/material.dart';
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

Future<void> addSpending(String name, int amount, String spendingType, DateTime date, BuildContext context, mounted) async {
  print(name);

  final response = await http.post(Uri.parse('https://catfish.up.railway.app/cashflow/add-spending-mobile/'),
      headers: <String, String>{
        'Content-Type': 'application/json;charset=UTF-8'
      },
      body: jsonEncode(<String, dynamic>{
        'name' : name,
        'amount': amount,
        'spendingType': spendingType,
        'date': date.toString().split(" ")[0],
        }
      ),
  );
  print('halo');
} 

Future<void> deleteSpending(int pk) async {
  final url = Uri.parse('https://catfish.up.railway.app/cashflow/delete-spending/$pk');
  final headers = {'Content-type': 'application/json'};
  final response = await http.delete(url, headers: headers);}