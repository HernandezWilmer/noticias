import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class ArticleProvider {
  getArticles() async {
    Map<String, String> queryParameters = {
      'q': 'tesla',
      'from': '2021-04-30',
      'sortBy': 'publishedAt',
      'apiKey': 'cb138a72ec374a15abe19c412d8da9d1',
    };

    var url = Uri.https('newsapi.org', '/v2/everything', queryParameters);

    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse =
          convert.jsonDecode(response.body) as Map<String, dynamic>;
      var itemCount = jsonResponse['totalItems'];
      print('Number of books about http: $itemCount.');
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }
}
