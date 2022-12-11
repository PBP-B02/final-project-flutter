import 'package:catfish/navbar.dart';
import 'package:flutter/material.dart';

class MyIncomePage extends StatefulWidget {
  const MyIncomePage({super.key});

  @override
  State<MyIncomePage> createState() => _MyIncomePageState();
}

class _MyIncomePageState extends State<MyIncomePage> {
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
      body: Center()
    );
  }
}