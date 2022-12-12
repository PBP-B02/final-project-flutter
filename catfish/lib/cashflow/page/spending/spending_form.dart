import 'package:flutter/material.dart';
import 'package:catfish/cashflow/util/fetch_spending.dart';

class SpendingFormPage extends StatefulWidget {
    const SpendingFormPage({super.key});

    @override
    State<SpendingFormPage> createState() => _SpendingFormPageState();
}

class _SpendingFormPageState extends State<SpendingFormPage> {
  final _formKey = GlobalKey<FormState>();
  String name = "";
  DateTime spendingDate = DateTime.now();
  int amount = 0;
  String spendingType = 'Pilih Jenis';
  List<String> listJenis = ['Pilih Jenis','Food', 'Clothing','Utilities', 'Transportation', 'Saving' ,'Others'];
  List<List<String>> listData = [];
  final fieldName = TextEditingController();
  final fieldAmount = TextEditingController();

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
          child: Center(
            child: Container(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
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
                                name = value!;
                            });
                        },
                        // Menambahkan behavior saat data disimpan
                        onSaved: (String? value) {
                            setState(() {
                                name = value!;
                            });
                        },

                        controller: fieldName,
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
                                amount = int.parse(value!);
                            });
                        },
                        controller: fieldAmount,
                        // Menambahkan behavior saat data disimpan
                        onSaved: (String? value) {
                            setState(() {
                                amount = int.parse(value!);
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
                value: spendingType,
                icon: const Icon(Icons.keyboard_arrow_down),
                items: listJenis.map((String items) {
                return DropdownMenuItem(
                    value: items,
                    child: Text(items),
                );
                }).toList(),
                
                onChanged: (String? newValue) {
                setState(() {
                    spendingType = newValue!;
                });
                },
                
                validator: (String? spendingType) {
                            if (spendingType == 'Pilih Jenis') {
                                return 'Silahkan pilih jenis!';
                            }
                            return null;
                        },
                
              ),
            SizedBox(height: 20,),
            Text("Tanggal pengeluaran :", style: TextStyle(color: Color.fromARGB(97, 0, 0, 0), fontFamily: 'Inter', fontSize: 12),),
            SizedBox(height: 5,),
            Text(spendingDate == null ? 'Nothing has been picked yet' : spendingDate.toString().split(" ")[0],style: TextStyle(color: Color.fromARGB(255, 93, 177, 118), fontFamily: 'Inter', fontSize: 20 ,fontWeight: FontWeight.bold),),
            TextButton(

              child: Text('Pilih Tanggal Pengeluaran', style: TextStyle(color: Colors.white, fontFamily: 'Inter', fontSize: 12,)),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 93, 177, 118)),
              ),
              onPressed: () {
                showDatePicker(
                  context: context,
                  initialDate: spendingDate,
                  firstDate: DateTime(2001),
                  lastDate: DateTime(2023)
                ).then((date) {
                  setState(() {
                    spendingDate = date!;
                  });
                });
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
                  addSpending(name, amount, spendingType, spendingDate, context,mounted);
                  // ListBudget.listdata.add(Budget(name, amount, spendingType));
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
                                  "Nama: $name",
                                  style: TextStyle(color: Color.fromARGB(97, 0, 0, 0)),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "Nominal: $amount",
                                  style: TextStyle(color: Color.fromARGB(97, 0, 0, 0)),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "Jenis: $spendingType",
                                  style: TextStyle(color: Color.fromARGB(97, 0, 0, 0)),
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
                              fieldName.clear();
                              fieldAmount.clear();
                            },
                            child: Text('Kembali',),
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
        ),),)
      ),),
    );
  }
}