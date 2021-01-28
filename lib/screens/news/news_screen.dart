import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mesa_news_app/blocs/news_bloc.dart';
import 'package:mesa_news_app/components/text_error.dart';
import 'package:mesa_news_app/constants/colors.dart';
import 'package:mesa_news_app/models/news.dart';
import 'package:mesa_news_app/screens/filter/filter_screen.dart';
import 'package:mesa_news_app/screens/news/widgets/listview_highligths.dart';
import 'package:mesa_news_app/screens/news/widgets/listview_news.dart';
import 'package:mesa_news_app/utils/nav.dart';

/**
 * Created by Vinicius Budel on 27,Janeiro,2021
 */
class NewsScreen extends StatefulWidget {
  NewsScreen({Key key}) : super(key: key);

  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  final _bloc = NewsBloc();
  final _blocHighlight = NewsBloc();

  @override
  void initState() {
    super.initState();

    _bloc.getNews();
    _blocHighlight.getNewsHighlight();
  }

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
          IconButton(
            icon: Icon(Icons.dehaze),
            onPressed: () {
              push(context, FilterScreen());

            },
          )
        ],
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.fromLTRB(16, 24, 0, 0),
            child: Text(
              'Destaques',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
            ),
          ),
          _listHighlights(),
          Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.fromLTRB(16, 40, 0, 0),
            child: Text(
              'Últimas notícias',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
            ),
          ),
          _list(),
        ],
      ),
    );
  }

  _listHighlights() {
    return Container(
      margin: EdgeInsets.fromLTRB(16, 16, 0, 0),
      height: 128,
      child: StreamBuilder(
        stream: _blocHighlight.stream,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return TextError("Não foi possível buscar as noticias");
          }

          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          List<News> newsList = snapshot.data;
          newsList.sort((a, b) {
            return a.publishedAt.compareTo(b.publishedAt);
          });
          return RefreshIndicator(
            onRefresh: _onRefreshHighlights,
            child: ListviewHighligths(newsList),
          );
        },
      ),
    );
  }

  Future<void> _onRefreshHighlights() {
    return _bloc.getNewsHighlight();
  }

  _list() {
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(16),
        child: StreamBuilder(
          stream: _bloc.stream,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return TextError("Não foi possível buscar as noticias");
            }

            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            List<News> newsList = snapshot.data;
            newsList.sort((a, b) {
              return a.publishedAt.compareTo(b.publishedAt);
            });

            return RefreshIndicator(
              onRefresh: _onRefresh,
              child: ListviewNews(newsList),
            );
          },
        ),
      ),
    );
  }

  Future<void> _onRefresh() {
    return _bloc.getNews();
  }
}
