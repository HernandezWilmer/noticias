import 'package:flutter/material.dart';
import 'package:noticias/models/articulos.model.dart';
import 'package:noticias/providers/articles.provider.dart';
import 'package:noticias/widget/card.widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ArticleProvider articleProvider = ArticleProvider();
  Future<List<Articulo>> listaArticulos;

  @override
  void initState() {
    listaArticulos = articleProvider.getArticulos();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: _body(),
    );
  }

  _body() {
    return FutureBuilder(
        // initialData: [],
        future: listaArticulos,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            final datos = snapshot.data;
            List<CardWidget> listaTemporal = [];

            datos.forEach((element) {
              listaTemporal.add(CardWidget(articulo: element));
            });

            return ListView(
              children: listaTemporal,
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}
