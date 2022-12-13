import 'dart:convert';
import 'package:catfish/artikel/model/artikel_model.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:catfish/navbar.dart';
import 'package:catfish/artikel/page/artikel.dart';
import 'package:catfish/artikel/page/artikel_detail.dart';

class DetailArtikel extends StatelessWidget {
  final Artikel artikel;

  const DetailArtikel({Key? key, required this.artikel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Artikel Detail'),
      ),
      bottomNavigationBar: buildNavbar(context),
      body: SingleChildScrollView(
        child: Container(
            padding: const EdgeInsets.all(15),
            child: Column(children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      artikel.judul,
                      style: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 10, 11, 10)),
                    ),
                  ),
                  const SizedBox(height: 20),
                  RichText(
                    text: TextSpan(
                      style: const TextStyle(
                        color: Color(0xFF5DB075),
                      ),
                      children: <TextSpan>[
                        const TextSpan(
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF5DB075),
                                fontSize: 20)),
                        TextSpan(text: '${artikel.konten}\n'),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ])),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: const Icon(Icons.arrow_back),
      ),
    );
  }
}
