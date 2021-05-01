import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:noticias/models/article.model.dart';

class ArticleProvider {
  Future<List<Article>> getArticles() async {
    List<Article> articulos = [];

    try {
      Map<String, String> queryParameters = {
        'q': 'tesla',
        'from': '2021-03-30',
        'sortBy': 'publishedAt',
        'apiKey': '89009ac73341418593a1dafa0869a8d6',
      };

      var url = Uri.https('newsapi.org', '/v2/everything', queryParameters);

      var response = await http.get(url);
      if (response.statusCode == 200) {
        var jsonResponse =
            convert.jsonDecode(response.body) as Map<String, dynamic>;

        jsonResponse['articles']
            .forEach((item) => articulos.add(Article.fromJson(item)));

        return articulos;
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }
}
