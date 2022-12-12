import 'package:catfish/cashflow/model/my_spending_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SpendingDetailPage extends StatelessWidget{
  final MySpending spending;
  const SpendingDetailPage({super.key, required this.spending});
  

  @override
  Widget build(BuildContext context) {
    final idrCurrency = NumberFormat('#,##0', 'id-ID');
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children:[
          Container(
            height: 300,
            width: 330,
            decoration: BoxDecoration(color: Colors.white, boxShadow: [BoxShadow(color: Color.fromARGB(30, 0, 0, 0), blurRadius: 10.0)], borderRadius: BorderRadius.circular(10.0)),
            child: Column(
              children: [
                SizedBox(height: 25),
                Text ("Yeay, senang!", style: TextStyle(color: Color.fromARGB(255, 93, 177, 118), fontSize: 20, fontWeight: FontWeight.bold, fontFamily: 'Inter')),
                SizedBox(height: 10,),
                Image.asset("assets/images/piggybank.png", fit: BoxFit.contain, height: 160,),
                SizedBox(height: 10,),
                RichText(
                  text: TextSpan (
                          children: [
                              TextSpan(text: "Kamu telah menghabiskan uang untuk ", style: TextStyle(color:Color.fromARGB(165, 0, 0, 0), fontSize: 12, fontWeight: FontWeight.normal, fontFamily: 'Inter') ),
                              TextSpan(text: "${spending.fields.name}", style: TextStyle(color:Color.fromARGB(255, 93, 177, 118), fontSize: 12, fontWeight: FontWeight.normal, fontFamily: 'Inter') )
                              ]
                          )
                ),
                SizedBox(height: 2,),
                RichText(
                  text: TextSpan (
                          children: [
                              TextSpan(text: "sebesar ", style: TextStyle(color:Color.fromARGB(165, 0, 0, 0), fontSize: 12, fontWeight: FontWeight.normal, fontFamily: 'Inter') ),
                              TextSpan(text: "Rp. ${idrCurrency.format(spending.fields.amount)}", style: TextStyle(color:Color.fromARGB(255, 93, 177, 118), fontSize: 12, fontWeight: FontWeight.normal, fontFamily: 'Inter') )
                              ]
                          )
                ),
                SizedBox(height: 2,),
                RichText(
                  text: TextSpan (
                          children: [
                              TextSpan(text: "pada tanggal ", style: TextStyle(color:Color.fromARGB(165, 0, 0, 0), fontSize: 12, fontWeight: FontWeight.normal, fontFamily: 'Inter') ),
                              TextSpan(text: "${spending.fields.date.toString().split(" ")[0]}", style: TextStyle(color:Color.fromARGB(255, 93, 177, 118), fontSize: 12, fontWeight: FontWeight.normal, fontFamily: 'Inter') )
                              ]
                          )
                ),

              ]
              ),
          ),
          SizedBox(height: 25,),
          TextButton(

              child: const Text("Hapus",
                style: TextStyle(color: Colors.white, fontFamily: 'Inter', fontSize: 15),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 193, 43, 43)),
              ),
              onPressed: (){},
            ),
        ]

      ),
    );
  }
}