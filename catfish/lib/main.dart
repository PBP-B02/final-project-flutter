import 'package:catfish/cashflow/page/income/my_income_page.dart';
import 'package:catfish/cashflow/page/spending/my_spending_page.dart';
import 'package:catfish/cashflow/util/colormaker.dart';
import 'package:catfish/navbar.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';


class CashflowHome extends StatefulWidget {
  const CashflowHome({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<CashflowHome> createState() => _CashflowHomeState();
}

class _CashflowHomeState extends State<CashflowHome> {


  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      bottomNavigationBar: buildNavbar(context),
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
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
       // Menambahkan drawer menu
    bottomNavigationBar: buildNavbar(context),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: Column(

        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children:[
          const Center(
            child: Text ("Cashflow Tracker", style: TextStyle(color: Color.fromARGB(255, 93, 177, 118), fontSize: 32, fontWeight: FontWeight.bold, fontFamily: 'Inter'))
            ),
          const SizedBox(height: 20,),
          const Center(
            child: Text ("choose one:", style: TextStyle(color: Color.fromARGB(121, 0, 0, 0), fontSize: 12, fontWeight: FontWeight.normal, fontFamily: 'Inter'))
            ),
          const SizedBox(height: 10,),
          GestureDetector(
            onTap: (){
              Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                  MyIncomePage()
                              ),
                            );
            },
            child: Card(
              shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.white70, width: 1),
                borderRadius: BorderRadius.circular(20),
                ),
              elevation: 5,
              color: Color.fromARGB(255, 249, 255, 250),

              child: SizedBox(
                width: 300,
                height: 230,
                child: Column(
                  children: [
                    SizedBox(height: 10,),
                    Text("My Income", style: TextStyle(color: Color.fromARGB(200, 26, 26, 26), fontSize: 21, fontWeight: FontWeight.w600, fontFamily: 'Inter'),),
                    Image.asset(
                  'assets/images/vault.png',
                    fit: BoxFit.contain,
                    height: 150,
                    ),
                    Text("No matter how big or small it is,", style: TextStyle(color: Color.fromARGB(150, 26, 26, 0), fontSize: 13, fontWeight: FontWeight.normal, fontFamily: 'Inter'),),
                    Text("income is income.", style: TextStyle(color: Color.fromARGB(150, 26, 26, 0), fontSize: 13, fontWeight: FontWeight.normal, fontFamily: 'Inter'),),

                  ]
                  ),
                ),
              ),
          ),
          
          SizedBox(height: 30,),
          GestureDetector(
            onTap: (){
              Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                  MySpendingPage()
                              ),
                            );
            },
            child: Card(
              shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.white70, width: 1),
                borderRadius: BorderRadius.circular(20),
                ),
              elevation: 5,
              color: Color.fromARGB(255, 249, 255, 250),
              child: SizedBox(
                width: 300,
                height: 230,
                child: Column(
                  children: [
                    SizedBox(height: 10,),
                    Text("My Spending", style: TextStyle(color: Color.fromARGB(200, 26, 26, 26), fontSize: 21, fontWeight: FontWeight.w600, fontFamily: 'Inter'),),
                    Image.asset(
                  'assets/images/spending.png',
                    fit: BoxFit.contain,
                    height: 150,
                    ),
                    Text("Well tracked, well lived.", style: TextStyle(color: Color.fromARGB(150, 26, 26, 0), fontSize: 13, fontWeight: FontWeight.normal, fontFamily: 'Inter'),),

                  ]
                  ),
                ),
              ),
          ),
          ]
        ),
      ),
    );
  }
}