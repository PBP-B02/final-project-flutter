import 'package:catfish/cashflow/model/my_income_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<List<MyIncome>> fetchMyIncome() async {
  var url = Uri.parse(
      'https://catfish.up.railway.app/cashflow/json/income/');
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

Future<void> addIncome(String name, int amount, String incomeType, DateTime date, BuildContext context, mounted) async {
  print(name);

  final response = await http.post(Uri.parse('https://catfish.up.railway.app/cashflow/add-income-mobile/'),
      headers: <String, String>{
        'Content-Type': 'application/json;charset=UTF-8'
      },
      body: jsonEncode(<String, dynamic>{
        'name' : name,
        'amount': amount,
        'incomeType': incomeType,
        'date': date.toString().split(" ")[0],
        }
      ),
  );
  print('halo');
} 

Future<void> deleteIncome(int pk) async {
  final url = Uri.parse('https://catfish.up.railway.app/cashflow/delete-income/$pk');
  final headers = {'Content-type': 'application/json'};
  final response = await http.delete(url, headers: headers);}