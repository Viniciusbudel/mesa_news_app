import 'package:flutter/material.dart';
import 'package:mesa_news_app/constants/colors.dart';

/**
 * Created by Vinicius Budel on 27,Janeiro,2021
 */
class NewsScreen extends StatefulWidget {
  NewsScreen({Key key}) : super(key: key);

  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: blueMain,
        title: Text(
          "Mesa News",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(icon: Icon(Icons.dehaze), onPressed: () {  },)
        ],
      ),
    );
  }
}
