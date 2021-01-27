import 'package:flutter/material.dart';
import 'package:mesa_news_app/constants/colors.dart';

/**
 * Created by Vinicius Budel on 27,Janeiro,2021
 */
class BtnLogin extends StatelessWidget {
  final void Function() asyncFunc;
  bool showProgress;

  BtnLogin(this.asyncFunc, this.showProgress);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(16,32,16,0),
      width: double.infinity,
      child: RaisedButton(
        onPressed: asyncFunc,
        padding: EdgeInsets.all(16.0),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
            side: BorderSide(color: Colors.white)),
        color: blueMain,
        child: !showProgress
            ? Text(
                "Login",
                style: TextStyle(
                  color: Colors.white,
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
