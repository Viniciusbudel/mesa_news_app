import 'dart:async';

import 'package:mesa_news_app/apis/news_api.dart';
import 'package:mesa_news_app/models/news.dart';
import 'package:mesa_news_app/utils/simple_bloc.dart';

class NewsBloc extends SimpleBloc<List<News>> {
  Future<List<News>> getNews() async {
    try {
      List<News> carros = await NewsApi.getNews();

      add(carros);

      return carros;
    } catch (e) {
      addError(e);
    }

    return [];
  }

  Future<List<News>> getNewsHighlight() async {
    try {
      List<News> carros = await NewsApi.getNewsHighlight();

      add(carros);

      return carros;
    } catch (e) {
      addError(e);
    }

    return [];
  }
}
