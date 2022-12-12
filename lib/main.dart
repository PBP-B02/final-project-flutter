import 'package:flutter/material.dart';
import 'package:articlepage/page/article_list.dart';
import 'package:articlepage/page/article_list_net.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ArtikelNet(),
    );
  }
}
