import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:noticias/models/articulos.model.dart';

class CardWidget extends StatelessWidget {
  final Articulo articulo;

  CardWidget({this.articulo});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(articulo.title),
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(10.0),
      ),
    );
  }
}
