import 'dart:js';

import 'package:articlepage/data/data.dart';
import 'package:articlepage/models/article.dart';
import 'package:flutter/material.dart';
import 'package:articlepage/main.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:articlepage/widget/search_article.dart';

class ArticleList extends StatefulWidget {
  const ArticleList({Key? key}) : super(key: key);

  @override
  State<ArticleList> createState() => _State();
}

class _State extends State<ArticleList> {
  late List<Article> articles;
  String query = '';

  @override
  void initState() {
    super.initState();

    articles = allArticle;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
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
                icon: Icons.attach_money,
                text: 'Cashflow',
                onPressed: () {
                  // MaterialPageRoute(builder: (context) => const ClassName_Dito());
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
              GButton(
                icon: Icons.article,
                text: 'Artikel',
                onPressed: () {
                  MaterialPageRoute(builder: (context) => const ArticleList());
                },
              ),
            ],
          ),
        ),
      ),
      body: Column(
        children: <Widget>[
          buildSearch(),
          Expanded(
            child: ListView.builder(
              itemCount: articles.length,
              itemBuilder: (context, index) {
                final articlebuild = articles[index];

                return buildArticle(articlebuild);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget buildSearch() => SearchWidget(
        text: query,
        hintText: 'Cari Judul ya Bisa, Penulis ya bisa',
        onChanged: searchBook,
      );

  Widget buildArticle(Article article) => ListTile(
        // leading: Image.network(
        //   book.urlImage,
        //   fit: BoxFit.cover,
        //   width: 50,
        //   height: 50,
        // ),

        title: Text(
          article.title,
        ),
        subtitle: Text(article.author),
      );

  void searchBook(String query) {
    final books = allArticle.where((book) {
      final titleLower = book.title.toLowerCase();
      final authorLower = book.author.toLowerCase();
      final searchLower = query.toLowerCase();

      return titleLower.contains(searchLower) ||
          authorLower.contains(searchLower);
    }).toList();

    setState(() {
      this.query = query;
      this.articles = books;
    });
  }
}
