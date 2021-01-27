import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mesa_news_app/blocs/news_bloc.dart';
import 'package:mesa_news_app/components/text_error.dart';
import 'package:mesa_news_app/constants/colors.dart';
import 'package:mesa_news_app/models/news.dart';

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
            onPressed: () {},
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
          Container(
            margin: EdgeInsets.fromLTRB(16, 16, 0, 0),
            //height: 128,
            child: _listHighlights(),
          ),
          Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.fromLTRB(16, 40, 0, 0),
            child: Text(
              'Últimas notícias',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
            ),
          ),
          Expanded(
            child: Container(
                margin: EdgeInsets.fromLTRB(16, 16, 0, 0), child: _list()),
          ),
        ],
      ),
    );
  }

  _listHighlights() {
    return Container(
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

          return RefreshIndicator(
            onRefresh: _onRefreshHighlights,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: newsList.length,
              itemBuilder: (BuildContext context, int index) {
                News news = newsList[index];

                return Container(
                  width: 317,
                  child: Row(
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Card(
                          child: Image.network(
                            news.imageUrl,
                            width: 128,
                            height: 128,
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                      ),
                      Column(
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
                          Icon(Icons.favorite_border)
                        ],
                      )
                    ],
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }

  Future<void> _onRefreshHighlights() {
    return _bloc.getNewsHighlight();
  }

  _list() {
    return StreamBuilder(
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

        return RefreshIndicator(
          onRefresh: _onRefreshHighlights,
          child: ListView.builder(
            itemCount: newsList.length,
            shrinkWrap: true,
            itemBuilder: (ctx, index) {
              News news = newsList[index];
              return Container(
                height: 128,
                child: Card(
                  child: ListTile(
                      leading: Image.network(
                        news.imageUrl,
                        width: 128,
                        height: 128,
                      ),
                      title: Text(news.title),
                      subtitle: Text(news.content)),
                ),
              );
            },
          ),
        );
      },
    );
  }

  Future<void> _onRefresh() {
    return _bloc.getNews();
  }
}
