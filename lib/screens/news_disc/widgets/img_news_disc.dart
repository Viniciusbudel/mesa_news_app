import 'package:flutter/material.dart';
import 'package:mesa_news_app/models/news.dart';

/**
 * Created by Vinicius Budel on 29,Janeiro,2021
 */
class ImgNewsDisc extends StatelessWidget {
  final News news;

  ImgNewsDisc(this.news);

  @override
  Widget build(BuildContext context) {
    return Image.network(
      news.imageUrl,
      fit: BoxFit.fitWidth,
      width: double.infinity,
      height: 195,
    );
  }
}
