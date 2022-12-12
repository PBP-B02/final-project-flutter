import 'dart:convert';
import 'package:catfish/artikel/models/artikel_model.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:catfish/artikel/navbar.dart';
import 'package:catfish/artikel/pages/artikel.dart';
import 'package:catfish/artikel/pages/artikel_detail.dart';

class DetailArtikel extends StatelessWidget {
  final Artikel artikel;

  const DetailArtikel({Key? key, required this.artikel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ListTile addListTile(Artikel artikel) => ListTile(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
          title: Padding(
            padding: const EdgeInsets.only(left: 12.0),
            child: Text(
              artikel.judul,
            ),
          ),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DetailArtikel(
                          artikel: artikel,
                        )));
          },
        );

    Card addCard(Artikel artikel) => Card(
          margin: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
          elevation: 10,
          shape: const RoundedRectangleBorder(
            side: BorderSide(
              color: Color(0xFF5DB075),
            ),
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          child: Container(
            child: addListTile(artikel),
          ),
        );

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
                          fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(height: 20),
                  RichText(
                    text: TextSpan(
                      style: const TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                      ),
                      children: <TextSpan>[
                        const TextSpan(
                            text: 'Judul: ',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        TextSpan(text: '${artikel.judul}\n'),
                        const TextSpan(
                            text: 'Konten: ',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        TextSpan(text: '${artikel.konten}\n'),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
              FutureBuilder(builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.data == null) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  if (!snapshot.hasData) {
                    return Column(
                      children: const [
                        Text(
                          "Artikel tidak ada!",
                          style:
                              TextStyle(color: Color(0xFF5DB075), fontSize: 25),
                        ),
                        SizedBox(height: 8),
                      ],
                    );
                  } else {
                    return ListView.builder(
                        shrinkWrap: true,
                        itemCount: snapshot.data!.length,
                        itemBuilder: (_, index) =>
                            addCard(snapshot.data![index]));
                  }
                }
              }),
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
