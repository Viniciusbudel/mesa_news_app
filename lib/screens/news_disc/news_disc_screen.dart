import 'package:flutter/material.dart';
import 'package:mesa_news_app/constants/colors.dart';
import 'package:mesa_news_app/models/news.dart';

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
              Image.network(
                widget.news.imageUrl,
                fit: BoxFit.fitWidth,
                width: double.infinity,
                height: 195,
              ),
              Container(
                margin: EdgeInsets.only(top: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.favorite_border),
                    Text(
                      "24/03/2020 09h24 | Atualizada em 24/03/2020 14h54",
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 26),
                child: Text(
                  widget.news.title,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 12),
                child: Text(
                  widget.news.description,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                ),
              )
            ],
          ),
        ),
      ),
      bottomSheet: Container(
        color: fieldColor,
        height: 83,
        child: Row(
          children: [
            Container(
                margin: EdgeInsets.fromLTRB(18, 13, 74, 52),
                child: IconButton(
                    onPressed: () {}, icon: Icon(Icons.arrow_back_ios))),
            Container(
                margin: EdgeInsets.fromLTRB(0, 13, 74, 52),
                child: IconButton(
                    onPressed: () {}, icon: Icon(Icons.arrow_forward_ios))),
            Container(
                margin: EdgeInsets.fromLTRB(0, 13, 0, 52),
                child:
                    IconButton(onPressed: () {}, icon: Icon(Icons.ios_share))),
          ],
        ),
      ),
    );
  }
}
