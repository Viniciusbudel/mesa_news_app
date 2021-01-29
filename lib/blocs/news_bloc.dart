import 'dart:async';

import 'package:mesa_news_app/apis/news_api.dart';
import 'package:mesa_news_app/models/news.dart';
import 'package:mesa_news_app/utils/simple_bloc.dart';

class NewsBloc extends SimpleBloc<List<News>> {
  Future<List<News>> getNews() async {
    try {
      List<News> news = await NewsApi.getNews();

      add(news);

      return news;
    } catch (e) {
      addError(e);
    }

    return [];
  }

  Future<List<News>> getNewsByDate(String date) async {
    try {
      List<News> news = await NewsApi.getNewsByDate(date);

      add(news);

      return news;
    } catch (e) {
      addError(e);
    }

    return [];
  }

  Future<List<News>> getNewsHighlight() async {
    try {
      List<News> news = await NewsApi.getNewsHighlight();

      add(news);

      return news;
    } catch (e) {
      addError(e);
    }

    return [];
  }
}
