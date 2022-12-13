import 'dart:convert';
import 'dart:async';
import 'package:catfish/navbar.dart';
import 'package:catfish/artikel/page/artikel.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class AddArtikel extends StatefulWidget {
  const AddArtikel({Key? key}) : super(key: key);

  @override
  State<AddArtikel> createState() => _AddArtikel();
}

class _AddArtikel extends State<AddArtikel> {
  final _formKey = GlobalKey<FormState>();
  final judulController = TextEditingController();
  final tanggalController = TextEditingController();
  final kontenController = TextEditingController();

  String judul = "";
  String tanggal = "";
  String konten = "";

  void clearText() {
    judulController.clear();
    tanggalController.clear();
    kontenController.clear();
  }

  // Clean up the controller when the widget is disposed.
  @override
  void dispose() {
    judulController.dispose();
    tanggalController.dispose();
    kontenController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final request = context.watch<CookieRequest>();
    return Scaffold(
        appBar: AppBar(
          title: const Text('Tambah Artikel'),
        ),
        bottomNavigationBar: buildNavbar(context),
        body: Form(
            key: _formKey,
            child: Container(
                padding: const EdgeInsets.all(20),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text("Tambah Artikel",
                          style: TextStyle(fontSize: 18)),
                      TextFormField(
                          decoration: const InputDecoration(
                            hintText: "Bisnis dan Keuangan",
                            labelText: "judul",
                            icon: Icon(Icons.title, color: Color(0xFF5DB075)),
                          ),
                          controller: judulController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Masukkan Judul';
                            }
                            return null;
                          }),
                      TextFormField(
                          decoration: const InputDecoration(
                            hintText: "2022-12-12T05:34:42.752Z",
                            labelText: "tanggal",
                            icon: Icon(Icons.access_time_rounded,
                                color: Color(0xFF5DB075)),
                          ),
                          controller: tanggalController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Masukkan tanggal';
                            }
                            return null;
                          }),
                      TextFormField(
                          decoration: const InputDecoration(
                            hintText: "Konten",
                            labelText: "Konten",
                            icon: Icon(Icons.content_paste_search_sharp,
                                color: Color(0xFF5DB075)),
                          ),
                          controller: kontenController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Masukkan Konten';
                            }
                            return null;
                          }),
                      const SizedBox(height: 30),
                      ElevatedButton(
                          child: const Text('Submit'),
                          onPressed: () async {
                            if (_formKey.currentState!.validate() &&
                                judulController.text != "" &&
                                tanggalController.text != "" &&
                                kontenController.text != "") {
                              await http
                                  .post(
                                      Uri.parse(
                                          'https://catfish.up.railway.app/artikel/tambah-artikel/'),
                                      body: jsonDecode(jsonEncode({
                                        "judul": judulController.text,
                                        "tanggal": tanggalController.text,
                                        "konten": kontenController.text,
                                      })))
                                  .then((value) => {
                                        showDialog(
                                          context: context,
                                          builder: (context) {
                                            return Dialog(
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              elevation: 15,
                                              child: ListView(
                                                padding: const EdgeInsets.only(
                                                    top: 20, bottom: 20),
                                                shrinkWrap: true,
                                                children: <Widget>[
                                                  const Center(
                                                      child: Text(
                                                          'Artikel telah ditambahkan')),
                                                  const SizedBox(height: 20),
                                                  TextButton(
                                                    onPressed: () {
                                                      // back to recommendation page
                                                      Navigator.pop(context);
                                                      Navigator.of(context)
                                                          .push(
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                const ArtikelPage()),
                                                      );
                                                    },
                                                    child:
                                                        const Text('Kembali'),
                                                  ),
                                                ],
                                              ),
                                            );
                                          },
                                        )
                                      });
                            }
                          }),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text('kembali'),
                      ),
                    ]))));
  }
}
