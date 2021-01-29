import 'package:flutter/material.dart';
import 'package:mesa_news_app/models/news.dart';

/**
 * Created by Vinicius Budel on 29,Janeiro,2021
 */
class TxtDisc extends StatelessWidget {
  final News news;

  TxtDisc(this.news);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 12),
      child: Text(
        news.description,
        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
      ),
    );
  }
}
