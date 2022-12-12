import 'package:flutter/material.dart';

class IncomeFormPage extends StatefulWidget {
    const IncomeFormPage({super.key});

    @override
    State<IncomeFormPage> createState() => _IncomeFormPageState();
}

class _IncomeFormPageState extends State<IncomeFormPage> {
  final _formKey = GlobalKey<FormState>();
  String _namaBudget = "";
  int _nominal = 0;
  double umur = 0;
  String _jenis = 'Pilih Jenis';
  List<String> listJenis = ['Pilih Jenis','Salary', 'Passive'];
  List<List<String>> listData = [];
  final fieldJudul = TextEditingController();
  final fieldNominal = TextEditingController();

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                  Image.asset(
                 'assets/images/catfishlogo.png',
                  fit: BoxFit.contain,
                  height: 150,
              ),
              ],

          ),
        backgroundColor: Colors.white,
      ),
        body: Form(key: _formKey, child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Padding(
                    // Menggunakan padding sebesar 8 pixels
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                        decoration: InputDecoration(
                            hintText: "Contoh: Sate Pacil",
                            labelText: "Judul",
                            // Menambahkan icon agar lebih intuitif
                            icon: const Icon(Icons.account_balance_wallet_outlined),
                            // Menambahkan circular border agar lebih rapi
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                            ),
                        ),
                        // Menambahkan behavior saat nama diketik 
                        onChanged: (String? value) {
                            setState(() {
                                _namaBudget = value!;
                            });
                        },
                        // Menambahkan behavior saat data disimpan
                        onSaved: (String? value) {
                            setState(() {
                                _namaBudget = value!;
                            });
                        },

                        controller: fieldJudul,
                        // Validator sebagai validasi form
                        validator: (String? value) {
                            if (value == null || value.isEmpty) {
                                return 'Nama lengkap tidak boleh kosong!';
                            }
                            return null;
                        },
                    ),
                ),
                Padding(
                    // Menggunakan padding sebesar 8 pixels
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                        decoration: InputDecoration(
                            hintText: "Contoh: 20000",
                            labelText: "Nominal",
                            // Menambahkan icon agar lebih intuitif
                            icon: const Icon(Icons.money),
                            // Menambahkan circular border agar lebih rapi
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                            ),
                        ),
                        // Menambahkan behavior saat nama diketik 
                        onChanged: (String? value) {
                            setState(() {
                                _nominal = int.parse(value!);
                            });
                        },
                        controller: fieldNominal,
                        // Menambahkan behavior saat data disimpan
                        onSaved: (String? value) {
                            setState(() {
                                _nominal = int.parse(value!);
                            });
                        },
                        // Validator sebagai validasi form
                        validator: (String? value) {
                            if (value == null || value.isEmpty) {
                                return 'Nominal tidak boleh kosong!';
                            }
                            if (int.tryParse(value) == null){
                              return 'Nominal harus dalam bentuk angka!';
                            }
                            return null;
                        },
                    ),
                ),
            DropdownButtonFormField(
                value: _jenis,
                icon: const Icon(Icons.keyboard_arrow_down),
                items: listJenis.map((String items) {
                return DropdownMenuItem(
                    value: items,
                    child: Text(items),
                );
                }).toList(),
                
                onChanged: (String? newValue) {
                setState(() {
                    _jenis = newValue!;
                });
                },
                
                validator: (String? _jenis) {
                            if (_jenis == 'Pilih Jenis') {
                                return 'Silahkan pilih jenis!';
                            }
                            return null;
                        },
                
              ),
            TextButton(
              child: const Text(
                "Simpan",
                style: TextStyle(color: Colors.white),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.blue),
              ),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  // ListBudget.listdata.add(Budget(_namaBudget, _nominal, _jenis));
                  showDialog(
                context: context,
                builder: (context) {
                  return Dialog(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    elevation: 15,
                    child: Container(
                      child: ListView(
                        padding: const EdgeInsets.only(top: 20, bottom: 20),
                        shrinkWrap: true,
                        children: <Widget>[
                          Center(child: const Text('Berhasil ditambahkan!')),
                          SizedBox(height: 20),
                          Center(
                            child: Column(
                              crossAxisAlignment:CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Nama: $_namaBudget",
                                  style: TextStyle(color: Colors.blue),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "Nominal: $_nominal",
                                  style: TextStyle(color: Colors.blue),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "Jenis: $_jenis",
                                  style: TextStyle(color: Colors.blue),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                
                              ],
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                              fieldJudul.clear();
                              fieldNominal.clear();
                            },
                            child: Text('Kembali'),
                          ), 
                        ],
                      ),
                    ),
                  );
                },
              );
                }
              },
            ),

          ],
        ),),
      ),),
    );
  }
}