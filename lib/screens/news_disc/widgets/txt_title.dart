import 'package:flutter/material.dart';
import 'package:mesa_news_app/models/news.dart';

/**
 * Created by Vinicius Budel on 29,Janeiro,2021
 */
class TxtTitle extends StatelessWidget {
  final News news;

  TxtTitle(this.news);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 26),
      child: Text(
        news.title,
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
      ),
    );
  }
}
