import 'package:flutter/material.dart';
import 'package:mesa_news_app/models/news.dart';

/**
 * Created by Vinicius Budel on 28,Janeiro,2021
 */
class ImgHighligths extends StatelessWidget {
  final News news;

  ImgHighligths(this.news);

  @override
  Widget build(BuildContext context) {
    return news.imageUrl.isNotEmpty
        ? Container(
            alignment: Alignment.centerLeft,
            child: Image.network(
              news.imageUrl,
              width: 128,
              height: 128,
              fit: BoxFit.fitHeight,
            ),
          )
        : Container();
  }
}
