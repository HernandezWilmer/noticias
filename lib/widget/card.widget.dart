import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:noticias/models/article.model.dart';
import 'package:noticias/pages/detalle-articulo.page.dart';

class CardWidget extends StatelessWidget {
  final Article dataArticle;

  CardWidget({this.dataArticle});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetalleArticulo(
                dataAriculo: dataArticle,
              ),
            ),
          );
        },
        child: Container(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      //instalar paquete import 'package:intl/intl.dart';
                      DateFormat('yyyy-MM-dd').format(dataArticle.publishedAt),
                      // dataArticle.publishedAt.toString(),
                      style: TextStyle(
                        fontSize: 10,
                      ),
                    ),
                    Icon(Icons.more_vert)
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  dataArticle.title,
                  style: TextStyle(fontSize: 20),
                ),
              ),
              dataArticle.urlToImage == ''
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
                        imageUrl: dataArticle.urlToImage,
                        placeholder: (context, url) =>
                            CircularProgressIndicator(),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      ),
                    )
              //: Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: ClipRRect(
              //     borderRadius: BorderRadius.circular(5.0),
              //     child: FadeInImage(
              //       placeholder: AssetImage('assets/loading.gif'),
              //       image: NetworkImage(dataArticle.urlToImage),
              //       fit: BoxFit.cover,
              //     ),
              //   ),
              // )
            ],
          ),
          decoration: BoxDecoration(
            color: Colors.black12,
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      ),
    );
  }
}
