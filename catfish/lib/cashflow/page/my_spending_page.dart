import 'package:catfish/navbar.dart';
import 'package:flutter/material.dart';

class MySpendingPage extends StatefulWidget {
  const MySpendingPage({super.key});

  @override
  State<MySpendingPage> createState() => _MySpendingPageState();
}

class _MySpendingPageState extends State<MySpendingPage> {
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