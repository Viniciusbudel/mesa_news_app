import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mesa_news_app/constants/globals.dart' as globals;
import 'package:mesa_news_app/models/news.dart';
import 'package:mesa_news_app/utils/prefs.dart';

class NewsApi {
  static Future<List<News>> getNews() async {
    try {
      String token = await Prefs.getString("token");

      String prefUrl = globals.strWebService;
      String endpoint = '/v1/client/news?per_page=1000';
      var url = '$prefUrl$endpoint';

      Map<String, String> headers = {
        "Content-Type": "application/json",
        "Authorization": "Bearer ${token}"
      };

      final response = await http.get(url, headers: headers);

      if (response.statusCode == 200) {
        Map mapResponse = json.decode(response.body);

        List list = mapResponse["data"];

        final news = list.map<News>((map) => News.fromJson(map)).toList();
        return news;
      }
      return throw Exception("Erro ao buscar notícias");
    } catch (error, exception) {
      print("erro no login $error > $exception");
      return throw Exception("Erro ao buscar");
    }
  }

  static Future<List<News>> getNewsHighlight() async {
    try {
      String token = await Prefs.getString("token");

      String prefUrl = globals.strWebService;
      String endpoint = '/v1/client/news/highlights?per_page=1000';
      var url = '$prefUrl$endpoint';

      Map<String, String> headers = {
        "Content-Type": "application/json",
        "Authorization": "Bearer ${token}"
      };

      final response = await http.get(url, headers: headers);

      if (response.statusCode == 200) {
        Map mapResponse = json.decode(response.body);

        List list = mapResponse["data"];

        final news = list.map<News>((map) => News.fromJson(map)).toList();
        return news;
      }

      return throw Exception("Erro ao buscar notícias");
    } catch (error, exception) {
      print("erro no login $error > $exception");
      return throw Exception("Erro ao buscar");
    }
  }
}
