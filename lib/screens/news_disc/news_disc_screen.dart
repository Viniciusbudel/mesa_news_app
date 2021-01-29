import 'package:flutter/material.dart';
import 'package:mesa_news_app/constants/colors.dart';
import 'package:mesa_news_app/models/news.dart';
import 'package:mesa_news_app/screens/news/widgets/img_news.dart';
import 'package:mesa_news_app/screens/news_disc/widgets/botton_sheet.dart';
import 'package:mesa_news_app/screens/news_disc/widgets/row_news_disc.dart';
import 'package:mesa_news_app/screens/news_disc/widgets/txt_disc.dart';
import 'package:mesa_news_app/screens/news_disc/widgets/txt_title.dart';

/**
 * Created by Vinicius Budel on 28,Janeiro,2021
 */
class NewsDiscScreen extends StatefulWidget {
  final News news;

  NewsDiscScreen(this.news);

  @override
  _NewsDiscScreenState createState() => _NewsDiscScreenState();
}

class _NewsDiscScreenState extends State<NewsDiscScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: blueMain,
        leading: IconButton(
          icon: Icon(Icons.close),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Column(
          children: [
            Text(
              widget.news.title,
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 13),
            ),
            Text(
              "mesanews.com.br",
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 10),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.more_horiz),
            onPressed: () {},
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          margin: EdgeInsets.all(16),
          child: Column(
            children: [
              ImgNews(widget.news),
              RowNewsDisc(),
              TxtTitle(widget.news),
              TxtDisc(widget.news)
            ],
          ),
        ),
      ),
      bottomSheet: BottonSheet(),
    );
  }
}
