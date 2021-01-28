import 'package:flutter/material.dart';
import 'package:mesa_news_app/models/news.dart';

/**
 * Created by Vinicius Budel on 28,Janeiro,2021
 */
class ListtileHighligths extends StatelessWidget {
  final News news;
  final void Function() asyncFunc;

  ListtileHighligths(this.news,this.asyncFunc);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(left: 8),
          width: 173,
          alignment: Alignment.topLeft,
          child: Expanded(
            child: Text(
              news.title,
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
        Row(
          children: [
            Container(
                margin: EdgeInsets.only(left: 8, top: 4),
                child: IconButton(
                  icon: news.favorite
                      ? Icon(Icons.favorite)
                      : Icon(Icons.favorite_border),
                  onPressed: () {
                    news.favorite = news.favorite ? true : false;

                  },
                )),
            Container(
                margin: EdgeInsets.only(left: 8, top: 9),
                child: Text(
                  "16 Horas atrás",
                  style: TextStyle(fontSize: 13),
                )),
          ],
        )
      ],
    );
  }
}
