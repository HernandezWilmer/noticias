import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:noticias/models/articulos.model.dart';

class CardWidget extends StatelessWidget {
  final Articulo articulo;

  CardWidget({this.articulo});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(DateFormat('yyy:MM:DD').format(articulo.publishedAt)),
                ],
              ),
            ),
            FadeInImage(
                placeholder: AssetImage('assets/loading.gif'),
                image: NetworkImage(articulo.urlToImage)),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(articulo.title),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(articulo.description),
            ),
          ],
        ),
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
