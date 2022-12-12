import 'package:catfish/artikel/models/artikel_model.dart';
import 'package:flutter/material.dart';
import 'package:catfish/artikel/navbar.dart';
import 'package:catfish/artikel/pages/artikel.dart';
import 'package:catfish/artikel/utils/fetch_artikel.dart';
import 'package:catfish/artikel/pages/artikel_detail.dart';
import 'package:catfish/artikel/pages/artikel_add.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';

class ArtikelPage extends StatefulWidget {
  const ArtikelPage({Key? key}) : super(key: key);

  @override
  State<ArtikelPage> createState() => _ArtikelPage();
}

class _ArtikelPage extends State<ArtikelPage> {
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
          elevation: 7,
          shape: const RoundedRectangleBorder(
            side: BorderSide(
              color: Colors.lightGreen,
            ),
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
          child: Container(
            child: addListTile(artikel),
          ),
        );

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Artikel'),
      ),
      bottomNavigationBar: buildNavbar(context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            FutureBuilder(
                future: fetchArtikel(),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.data == null) {
                    return const Center(child: CircularProgressIndicator());
                  } else {
                    if (!snapshot.hasData) {
                      return Column(
                        children: const [
                          Text(
                            "Artikel kosong!",
                            style: TextStyle(
                                color: Color(0xFF5DB075), fontSize: 20),
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
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const AddArtikel()));
        },
        backgroundColor: const Color(0xFF5DB075),
        child: const Icon(Icons.add),
      ),
    );
  }
}
