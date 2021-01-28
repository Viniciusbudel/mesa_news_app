import 'package:flutter/material.dart';
import 'package:mesa_news_app/models/news.dart';
import 'package:mesa_news_app/screens/news/widgets/img_news.dart';
import 'package:mesa_news_app/screens/news/widgets/listtile_news.dart';
import 'package:mesa_news_app/screens/news_disc/news_disc_screen.dart';
import 'package:mesa_news_app/utils/nav.dart';

/**
 * Created by Vinicius Budel on 28,Janeiro,2021
 */
class ListviewNews extends StatelessWidget {
  final List<News> newsList;

  ListviewNews(this.newsList);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: newsList.length,
      shrinkWrap: true,
      itemBuilder: (ctx, index) {
        News news = newsList[index];
        return GestureDetector(
          onTap: () => push(context, NewsDiscScreen(news)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ImgNews(news),
              ListtileNews(news)
            ],
          ),
        );
      },
    );
  }
}
