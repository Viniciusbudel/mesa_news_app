import 'package:flutter/material.dart';
import 'package:mesa_news_app/models/news.dart';
import 'package:mesa_news_app/screens/news/widgets/img_highligths.dart';
import 'package:mesa_news_app/screens/news/widgets/listtile_highligths.dart';
import 'package:mesa_news_app/screens/news_disc/news_disc_screen.dart';
import 'package:mesa_news_app/utils/nav.dart';

/**
 * Created by Vinicius Budel on 28,Janeiro,2021
 */
class ListviewHighligths extends StatelessWidget {
  final List<News> newsList;

  ListviewHighligths(this.newsList);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemCount: newsList.length,
      itemBuilder: (BuildContext context, int index) {
        News news = newsList[index];

        return GestureDetector(
          onTap: () => push(context, NewsDiscScreen(news)),

          child: Container(
            width: 317,
            child: Row(
              children: [
                ImgHighligths(news),
                ListtileHighligths(news),
              ],
            ),
          ),
        );
      },
    );
  }
}
