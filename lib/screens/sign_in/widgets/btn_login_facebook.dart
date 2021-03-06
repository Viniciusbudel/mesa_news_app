import 'package:flutter/material.dart';
import 'package:mesa_news_app/constants/colors.dart';

/**
 * Created by Vinicius Budel on 27,Janeiro,2021
 */
class BtnLoginFacebook extends StatelessWidget {
  final void Function() asyncFunc;
  bool showProgress;

  BtnLoginFacebook(this.asyncFunc, this.showProgress);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(16,80,16,0),
      width: double.infinity,
      child: RaisedButton(
        onPressed: asyncFunc,
        padding: EdgeInsets.all(16.0),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
            side: BorderSide(color: blueMain)),
        color: Colors.white,
        child: !showProgress
            ? Text(
                "Entrar com facebook",
                style: TextStyle(
                  color: blueMain,
                  fontSize: 15.0,
                  fontWeight: FontWeight.w500,
                ),
              )
            : Center(
                child: CircularProgressIndicator(
                  valueColor: new AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              ),
      ),
    );
  }
}
