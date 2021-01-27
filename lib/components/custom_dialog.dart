import 'package:flutter/material.dart';
import 'package:mesa_news_app/constants/colors.dart';

class DialogUtils {
  static DialogUtils _instance = new DialogUtils.internal();

  DialogUtils.internal();

  factory DialogUtils() => _instance;

  static void showCustomDialog(BuildContext context,
      {@required String title,
      String okBtnText = "Ok",
      String cancelBtnText = "Cancelar",

      @required Function okBtnFunction}) {
    showDialog(

        context: context,

        builder: (_) {
          return AlertDialog(
            backgroundColor: blueMain,
            title: Text(
              title,
              style: TextStyle(fontWeight: FontWeight.bold,color: mesaColor),
            ),
            //content: /* Here add your custom widget  */,
            actions: <Widget>[
              FlatButton(
                  child: Text(cancelBtnText,style: TextStyle(color: Colors.white),),
                  onPressed: () => Navigator.pop(context)),
              FlatButton(
                child: Text(okBtnText,style: TextStyle(color: Colors.white)),
                onPressed: okBtnFunction,
              ),
            ],
          );
        });
  }
}
