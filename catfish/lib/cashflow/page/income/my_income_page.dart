import 'package:catfish/cashflow/page/income/income_detail.dart';
import 'package:catfish/cashflow/page/income/income_form.dart';
import 'package:catfish/cashflow/util/fetch_income.dart';
import 'package:catfish/navbar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MyIncomePage extends StatefulWidget {
  const MyIncomePage({super.key});

  @override
  State<MyIncomePage> createState() => _MyIncomePageState();
}

class _MyIncomePageState extends State<MyIncomePage> {
  final idrCurrency = NumberFormat('#,##0','id-ID');
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
      bottomNavigationBar: buildNavbar(context),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Center(
            child: Text ("My Income", style: TextStyle(color: Color.fromARGB(255, 93, 177, 118), fontSize: 32, fontWeight: FontWeight.bold, fontFamily: 'Inter'))
            ),
            SizedBox(height: 20,),
            Container(
              height: 450,
              width: 400,
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: const [BoxShadow(color: Color.fromARGB(30, 0, 0, 0), blurRadius: 10.0)]
                ),
              child: Container(
                child: FutureBuilder(
                  future: fetchMyIncome(),
                  builder: (context, AsyncSnapshot snapshot) {
                    if (snapshot.data == null) {
                      return const Center(child: CircularProgressIndicator());
                    } else {
                      if (!snapshot.hasData) {
                        return Column(
                          children: const [
                            Text(
                              "Tidak ada Income :(",
                              style: TextStyle(color: Color(0xff59A5D8), fontSize: 20),
                            ),
                            SizedBox(height: 8),
                          ],
                        );
                      } else {
                        return ListView.builder(
                          itemCount: snapshot.data!.length,
                          itemBuilder: (_, index) => GestureDetector(
                            onTap: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                    IncomeDetailPage(
                                      income: snapshot.data![index],
                                    )
                                ),
                              );
                            },
                            child:Container(
                            margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                            padding: const EdgeInsets.all(20.0),
                            decoration: BoxDecoration(border: Border.all(color: Color.fromARGB(28, 0, 0, 0), width: 1)),
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                              child: Row(
                                children:[
                                  Image.asset('assets/images/salary2.png',
                                  fit: BoxFit.contain,
                                  height: 40,),
                                  SizedBox(width: 5,),
                                  SizedBox(
                                    width: 265,
                                    child: Row(
                                      children: [
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text("${snapshot.data![index].fields.name}",style: TextStyle(fontFamily: 'Inter', fontSize: 18, fontWeight: FontWeight.bold, color:Color.fromARGB(165, 0, 0, 0)),),
                                            Text("${snapshot.data![index].fields.date.toString().split(" ")[0]}",style: TextStyle(fontFamily: 'Inter', fontSize: 11, fontWeight: FontWeight.normal, color:Color.fromARGB(165, 0, 0, 0)),)
                                          ],                               
                                        ),
                                        Spacer(),
                                        Text("Rp. " + idrCurrency.format(snapshot.data![index].fields.amount),style: TextStyle(fontFamily: 'Inter', fontSize: 15, fontWeight: FontWeight.bold, color:Color.fromARGB(255, 93, 177, 118))),]
                                      )
                                  )
                                ],
                              )
                            )
                          )
                          )
                        );
                      }
                    }
                  }
                ),
              )
              
            ),
            SizedBox(height: 20,),
            TextButton(
              child: const Text("+",
                style: TextStyle(color: Colors.white, fontFamily: 'Inter', fontSize: 20),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 93, 177, 118)),
              ),
              onPressed: (){
                Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                    IncomeFormPage()
                                ),
                              );

              },
            ),
          ],
        ),
      )
    );
  }
}