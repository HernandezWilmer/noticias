import 'package:flutter/material.dart';
import 'package:noticias/providers/articles.provider.dart';
//pub.dev

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ArticleProvider articleProvider = ArticleProvider();

  @override
  Widget build(BuildContext context) {
    articleProvider.getArticles();
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculadora IMC"),
      ),
      body: _body(),
    );
  }

  Widget _body() {
    return Container(
      child: Text('Contenido home'),
    );
  } // Cierre del _body
} // Cierre de la clase