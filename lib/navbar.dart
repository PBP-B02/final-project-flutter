import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:articlepage/page/article_list_net.dart';
import 'package:articlepage/page/article_list.dart';
import 'package:flutter/material.dart';

Container buildNavbar(BuildContext context) {
  return Container(
    color: const Color(0xFFF5F5F5),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
      child: GNav(
        backgroundColor: const Color(0xFFF5F5F5),
        color: const Color(0xFFD9DCE0),
        activeColor: const Color(0xFF5DB075),
        tabBackgroundColor: const Color(0xFFE7F3EA),
        gap: 8,
        onTabChange: (index) {
          print(index);
        },
        padding: const EdgeInsets.all(16),
        tabs: [
          GButton(
            icon: Icons.attach_money,
            text: 'Cashflow',
            onPressed: () {
              MaterialPageRoute(builder: (context) => const CashflowHome());
            },
          ),
          GButton(
            icon: Icons.assessment,
            text: 'Akumulasi',
            onPressed: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const RecapView()));
            },
          ),
          GButton(
            icon: Icons.article,
            text: 'Artikel',
            onPressed: () {
              MaterialPageRoute(builder: (context) => const ArtikelNet());
            },
          ),
          GButton(
            icon: Icons.create_rounded,
            text: 'Buat Artikel',
            onPressed: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const MyArtikel()));
            },
          ),
        ],
      ),
    ),
  );
}
