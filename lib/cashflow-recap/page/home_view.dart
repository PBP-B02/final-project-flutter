import 'package:catfish/cashflow-recap/page/history_income.dart';
import 'package:catfish/cashflow-recap/page/history_spending.dart';
import 'package:catfish/cashflow-recap/util/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart' as http;

import '../../navbar.dart';

class RecapView extends StatefulWidget {
  const RecapView({super.key});

  @override
  State<RecapView> createState() => _RecapViewState();
}

class _RecapViewState extends State<RecapView> {
  final _formKey = GlobalKey<FormState>();
  String hintMonth = "Bulan";
  String hintType = "Pilih tipe";
  String tipe = "";
  int bulan = 0;
  final List<String> list_month = <String>[
    'Januari',
    'Februari',
    'Maret',
    'April',
    'Mei',
    'Juni',
    'Juli',
    'Agustus',
    'September',
    'Oktober',
    'November',
    'Desember'
  ];

  final Map<String, int> value_month = {
    'Januari': 1,
    'Februari': 2,
    'Maret': 3,
    'April': 4,
    'Mei': 5,
    'Juni': 6,
    'Juli': 7,
    'Agustus': 8,
    'September': 9,
    'Oktober': 10,
    'November': 11,
    'Desember': 12,
  };

  final List<String> list_type = <String>['Pemasukan', 'Pengeluaran'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/catfishlogo.png',
                fit: BoxFit.contain,
                height: 150,
              )
            ],
          ),
          backgroundColor: Colors.white,
        ),
        bottomNavigationBar: buildNavbar(context),
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(20.0),
              margin: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Center(
                      child: Column(
                        children: [
                          DropdownButtonFormField(
                            hint: Text(
                              "${hintMonth}",
                              style: TextStyle(color: Colors.black),
                            ),
                            icon:
                                const Icon(Icons.keyboard_arrow_down_outlined),
                            elevation: 16,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                            items: list_month
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(
                                  value,
                                  style: TextStyle(color: Colors.black),
                                ),
                              );
                            }).toList(),
                            onChanged: (value) {
                              setState(() {
                                bulan = value_month[value!]!;
                                hintMonth = value;
                              });
                            },
                            validator: (value) {
                              if (value == null ||
                                  value.isEmpty ||
                                  value == "") {
                                return "Pilih bulan!";
                              }
                            },
                          ),
                          DropdownButtonFormField(
                            hint: Text(
                              "${hintType}",
                              style: TextStyle(color: Colors.black),
                            ),
                            icon:
                                const Icon(Icons.keyboard_arrow_down_outlined),
                            elevation: 16,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                            items: list_type
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(
                                  value,
                                  style: TextStyle(color: Colors.black),
                                ),
                              );
                            }).toList(),
                            onChanged: (value) {
                              setState(() {
                                tipe = value!;
                                hintType = value;
                              });
                            },
                            validator: (value) {
                              if (value == null ||
                                  value.isEmpty ||
                                  value == "") {
                                return "Pilih tipe!";
                              }
                            },
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  if (hintType == "Pemasukan") {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                HistoryIncomePage(bulan: bulan)));
                                  } else if (hintType == "Pengeluaran") {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                HistorySpendingPage(bulan: bulan,)));
                                  }
                                }
                              },
                              child: const Text(
                                "Cari",
                                style: TextStyle(color: Colors.white),
                              ),
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all(Colors.green)),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
