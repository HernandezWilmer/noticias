import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:noticias/models/article.model.dart';

class DetalleArticulo extends StatelessWidget {
  final Article dataAriculo;

  DetalleArticulo({this.dataAriculo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(dataAriculo.title),
      ),
      body: _body(),
    );
  }

  _body() {
    return Column(
      children: [
        dataAriculo.urlToImage == ''
            ? Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5.0),
                  child: Image(
                    image: AssetImage('assets/no-image.jpg'),
                    height: 200.0,
                  ),
                ),
              )
            : Padding(
                padding: const EdgeInsets.all(8.0),
                child: CachedNetworkImage(
                  imageUrl: dataAriculo.urlToImage,
                  placeholder: (context, url) => CircularProgressIndicator(),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Text(
                DateFormat('yyyy-MM-dd').format(dataAriculo.publishedAt),
                style: TextStyle(fontSize: 10),
                textAlign: TextAlign.left,
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(dataAriculo.description),
        ),
      ],
    );
  }
}
