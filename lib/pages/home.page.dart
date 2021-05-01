import 'package:flutter/material.dart';
import 'package:noticias/models/article.model.dart';
import 'package:noticias/providers/articles.provider.dart';
import 'package:noticias/widget/card.widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final articleProvider = new ArticleProvider();
  Future<List<Article>> listaArticulos;

  @override
  void initState() {
    listaArticulos = articleProvider.getArticles();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("home"),
      ),
      body: _body(),
    );
  }

  _body() {
    return FutureBuilder(
        future: listaArticulos,
        builder: (BuildContext context, AsyncSnapshot<List<Article>> snapshot) {
          if (snapshot.hasData) {
            final datos = snapshot.data;
            return ListView(
              children: datos.map((e) {
                return CardWidget(
                  dataArticle: e,
                );
              }).toList(),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        });
  }
}
