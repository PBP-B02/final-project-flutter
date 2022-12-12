import 'dart:async';

import 'package:catfish/articlepage/util/article_json_fetch.dart';
import 'package:catfish/main.dart';
// import 'package:articlepage/api/article_api.dart';
import 'package:catfish/articlepage/model/article_model.dart';
import 'package:catfish/articlepage/util/search_article.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:catfish/navbar.dart';
import 'package:catfish/artikel/page/artikel_detail.dart';

class ArtikelNet extends StatefulWidget {
  @override
  ArtikelNetState createState() => ArtikelNetState();
}

class ArtikelNetState extends State<ArtikelNet> {
  List<ArticleModel> articels = [];
  String query = '';
  Timer? debouncer;

  @override
  void initState() {
    super.initState();

    init();
  }

  @override
  void dispose() {
    debouncer?.cancel();
    super.dispose();
  }

  void debounce(
    VoidCallback callback, {
    Duration duration = const Duration(milliseconds: 1000),
  }) {
    if (debouncer != null) {
      debouncer!.cancel();
    }

    debouncer = Timer(duration, callback);
  }

  Future init() async {
    final articels = await ArticelsApi.getArticle(query);

    setState(() => this.articels = articels);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: buildNavbar(context),
      body: Column(
        children: <Widget>[
          buildSearch(),
          Expanded(
            child: ListView.builder(
              itemCount: articels.length,
              itemBuilder: (_, index) {
                final article = articels[index];
                return buildArticle(article);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget buildSearch() => SearchWidget(
        text: query,
        hintText: 'Cari Judul Artikel',
        onChanged: searchBook,
      );

  Widget buildArticle(ArticleModel article) => ListTile(
        title: Text(article.judul),
        subtitle: Text(article.tanggal),
        onTap: () {
          // Navigator.push(
          //     context,
          //     MaterialPageRoute(
          //         builder: (context) => DetailArtikel(
          //               artikel: article,
          //             )));
        },
      );

  Future searchBook(String query) async => debounce(() async {
        final articels = await ArticelsApi.getArticle(query);

        if (!mounted) return;

        setState(() {
          this.query = query;
          this.articels = articels;
        });
      });
}
