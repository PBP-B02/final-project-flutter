import 'package:catfish/cashflow/page/cashflow_home.dart';
import 'package:catfish/main.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

Container buildNavbar(BuildContext context){
  return Container(
        color: Color(0xFFF5F5F5),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
          child: GNav(
            backgroundColor: Color(0xFFF5F5F5),
            color: Color(0xFFD9DCE0),
            activeColor: Color(0xFF5DB075),
            tabBackgroundColor: Color(0xFFE7F3EA),
            gap: 8,
            onTabChange: (index) {
              print(index);
            },
            padding: EdgeInsets.all(16),
            tabs: [
              GButton(
                icon: Icons.article,
                text: 'Artikel',
                onPressed: () { 
                  Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const MyHomePage(title: '',)),
                  );
                },
              ),
              GButton(
                icon: Icons.attach_money,
                text: 'Cashflow',
                onPressed: () { 
                  Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const CashflowHome(title: 'Cashflow Tracker',)),
                  );
                },
              ),
              GButton(
                icon: Icons.assessment,
                text: 'Akumulasi',
                onPressed: () {
                  // MaterialPageRoute(builder: (context) => const ClassName_Bayu());
                },
              ),
              GButton(
                icon: Icons.create_rounded,
                text: 'Buat Artikel',
                onPressed: () {
                  // MaterialPageRoute(builder: (context) => const ClassName_Ramanti());
                },
              ),
            ],
          ),
        ),
      );
}