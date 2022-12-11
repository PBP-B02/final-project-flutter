import 'package:catfish/page/navbar.dart';
import 'package:flutter/material.dart';
import 'package:catfish/artikel/artikel_parse.dart';
import 'package:catfish/artikel/artikel_model.dart';

class MyArtikel extends StatefulWidget {
  const MyArtikel({super.key});

  @override
  State<MyArtikel> createState() => _MyDataState();
}

class DetailArtikel extends StatelessWidget {
  final MyArtikel thisArtikel;
  final Fields fields;

  const DetailArtikel(
      {Key? key, required this.thisArtikel, required this.fields})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detail Artikel')),
      bottomNavigationBar: buildNavbar(context),
      body: Container(
        alignment: Alignment.center,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            fields.judul,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
          ),
          const SizedBox(height: 10),
          Text(fields.konten),
          const SizedBox(height: 10),
        ]),
      ),
    );
  }
}

class MyFormPage extends StatefulWidget {
  const MyFormPage({super.key});

  @override
  State<MyFormPage> createState() => _MyFormPageState();
}

class _MyFormPageState extends State<MyFormPage> {
  final _formKey = GlobalKey<FormState>();
  String title = "";
  String content = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Artikel"),
      ),
      // Menambahkan drawer menu
      bottomNavigationBar: buildNavbar(context),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20.0),
            child: Column(children: [
              Padding(
                // Menggunakan padding sebesar 8 pixels
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: "Title",
                    // Menambahkan circular border agar lebih rapi
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  // Menambahkan behavior saat nama diketik
                  onChanged: (String? value) {
                    setState(() {
                      title = value!;
                    });
                  },
                  // Menambahkan behavior saat data disimpan
                  onSaved: (String? value) {
                    setState(() {
                      title = value!;
                    });
                  },
                  // Validator sebagai validasi form
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Title tidak boleh kosong!';
                    }
                  },
                ),
              ),
              Padding(
                // Menggunakan padding sebesar 8 pixels
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: "Content",
                    // Menambahkan circular border agar lebih rapi
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  // Menambahkan behavior saat nama diketik
                  onChanged: (String? value) {
                    setState(() {
                      content = value!;
                    });
                  },
                  // Menambahkan behavior saat data disimpan
                  onSaved: (String? value) {
                    setState(() {
                      content = value!;
                    });
                  },
                  // Validator sebagai validasi form
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Content tidak boleh kosong!';
                    }
                  },
                ),
              ),
              TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MyArtikel()),
                    );
                  },
                  child: const Text("Kembali")),
              TextButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.blue),
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return Dialog(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          elevation: 15,
                          child: ListView(
                            padding: const EdgeInsets.only(top: 20, bottom: 20),
                            shrinkWrap: true,
                            children: <Widget>[
                              const Center(
                                  child: Text(
                                'Berhasil Menambah Data!',
                                style: TextStyle(fontSize: 20),
                              )),
                              TextButton(
                                style: TextButton.styleFrom(
                                  backgroundColor: Colors.yellow,
                                ),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text('Kembali Menambah Artikel'),
                              ),
                              TextButton(
                                style: TextButton.styleFrom(
                                  backgroundColor: Colors.red,
                                ),
                                onPressed: () {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const MyArtikel()),
                                  );
                                },
                                child:
                                    const Text('Kembali Ke Tampilan Artikel'),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                    createMyArtikel(title, content);
                    setState(() {
                      _formKey.currentState?.reset();
                    });
                  }
                },
                child: const Text(
                  "Simpan",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}

class _MyDataState extends State<MyArtikel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Artikel"),
        ),
        // Menambahkan drawer menu
        bottomNavigationBar: buildNavbar(context),
        bottomSheet: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: ElevatedButton(
            child: const Text('Add Artikel'),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const MyFormPage()));
            },
          ),
        ),
        body: FutureBuilder(
          future: fetchMyArtikel(),
          builder: ((context, snapshot) {
            if (snapshot.data == null) {
              return const Center(child: CircularProgressIndicator());
            } else {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    final item = snapshot.data!.elementAt(index);
                    return SingleChildScrollView(
                      child: ListTile(
                        shape: const ContinuousRectangleBorder(
                          side: BorderSide(color: Colors.black, width: 1),
                        ),
                        title: Text(item.fields.judul),
                        subtitle: Text(item.fields.konten),
                        // onTap: () {
                        //   Navigator.push(
                        //       context,
                        //       MaterialPageRoute(
                        //           builder: (context) => DetailArtikel(
                        //               thisArtikel: thisArtikel, fields: fields)));
                        // },
                      ),
                    );
                  },
                );
              } else {
                return Column(
                  children: const [
                    Text("Belum ada artikel"),
                    SizedBox(height: 8),
                  ],
                );
              }
            }
          }),
        ));
  }
}
