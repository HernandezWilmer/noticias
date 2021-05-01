import 'package:noticias/page/home-page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Noticias",
      theme: ThemeData.dark(),
      home: HomePage(),
    );
  }
}
