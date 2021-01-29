import 'package:flutter/material.dart';
import 'package:mesa_news_app/constants/colors.dart';

/**
 * Created by Vinicius Budel on 29,Janeiro,2021
 */
class BottonSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
