import 'package:flutter/material.dart';
import 'package:mesa_news_app/models/news.dart';

/**
 * Created by Vinicius Budel on 28,Janeiro,2021
 */
class ImgNews extends StatelessWidget {
  final News news;

  ImgNews(this.news);

  @override
  Widget build(BuildContext context) {
    return news.imageUrl != null
        ? Container(
            margin: EdgeInsets.only(top: 24),
            alignment: Alignment.centerLeft,
            child: Image.network(
              news.imageUrl,
              width: double.infinity,
              height: 145,
              fit: BoxFit.fitWidth,
            ),
          )
        : Container();
  }
}
