import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mesa_news_app/components/text_error.dart';
import 'package:mesa_news_app/constants/colors.dart';

/**
 * Created by Vinicius Budel on 28,Janeiro,2021
 */
class FilterScreen extends StatefulWidget {
  FilterScreen({Key key}) : super(key: key);

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool isSwitched = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: blueMain,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: blueLight,
          ),
          onPressed: () {},
        ),
        title: Text(
          "Filtro",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          Text(
            'Limpar',
            style: TextStyle(color: blueLight),
          )
        ],
      ),
      body: Container(
        margin: EdgeInsets.fromLTRB(16, 24, 0, 0),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              child: Row(
                children: [
                  Expanded(
                    flex: 6,
                    child: Text(
                      "Data",
                      style: TextStyle(
                          color: blueMain,
                          fontWeight: FontWeight.w700,
                          fontSize: 17),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Container(
                      alignment: Alignment.centerRight,
                      child: Text(
                        "Essa semana",
                        style: TextStyle(
                            color: blueMain,
                            fontStyle: FontStyle.italic,
                            fontSize: 17),
                      ),
                    ),
                  ),
                  Expanded(
                      flex: 1,
                      child: Container(child: Icon(Icons.arrow_forward_ios))),
                ],
              ),
            ),
            Divider(),
            Container(
              width: double.infinity,
              child: Row(
                children: [
                  Expanded(
                    flex: 85,
                    child: Text(
                      "Apenas Favoritos",
                      style: TextStyle(
                          color: blueMain,
                          fontWeight: FontWeight.w700,
                          fontSize: 17),
                    ),
                  ),
                  Expanded(
                    flex: 15,
                    child: Switch(
                      value: isSwitched,
                      onChanged: (value) {
                        setState(() {
                          isSwitched = value;
                          print(isSwitched);
                        });
                      },
                      activeTrackColor: Colors.lightGreenAccent,
                      activeColor: Colors.green,
                    )),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomSheet: Container(
        color: blueMain,
        width: double.infinity,
        height: 83,
        child: Container(
          alignment: Alignment.topCenter,
          margin: EdgeInsets.only(top: 10),
          child: Text(
            "Filtrar",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.w700, fontSize: 15),
          ),
        ),
      ),
    );
  }
}
