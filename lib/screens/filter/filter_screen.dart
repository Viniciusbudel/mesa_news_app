import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mesa_news_app/constants/colors.dart';
import 'package:mesa_news_app/screens/news/news_screen.dart';
import 'package:mesa_news_app/utils/nav.dart';

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
  DateTime selectedDate = DateTime.now();
  DateTime dateNow = DateTime.now();
  String data = "";
  String dataApi = "";
  final formatApi = new DateFormat('yyyy-MM-dd');
  final formatPtBR = new DateFormat('dd/MM/yyyy');

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
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Center(
          child: Text(
            "Filtro",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        actions: [
          Center(
            child: Text(
              'Limpar',
              style: TextStyle(color: blueLight, fontSize: 17),
            ),
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
                        data,
                        style: TextStyle(
                            color: blueMain,
                            fontStyle: FontStyle.italic,
                            fontSize: 17),
                      ),
                    ),
                  ),
                  Expanded(
                      flex: 1,
                      child: GestureDetector(
                          onTap: () => _selectDate(context),
                          child: Icon(Icons.arrow_forward_ios))),
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
      bottomSheet: GestureDetector(
        onTap: () => push(context, NewsScreen(date:dataApi)),
        child: Container(
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
      ),
    );
  }

  _selectDate(BuildContext context) async {
    try {
      final DateTime picked = await showDatePicker(
          context: context,
          initialDate: dateNow,
          firstDate: DateTime(2000),
          lastDate: DateTime(2022));
      if (picked != null) {
        selectedDate = picked;
        data = selectedDate.toString();
        data = data.replaceAll(" ", "T");

        setState(() {
          data = formatPtBR.format(picked).toString();
        });

        dataApi = formatApi.format(picked).toString();
      }
    } catch (e) {
      print(e);
    }
  }
}
