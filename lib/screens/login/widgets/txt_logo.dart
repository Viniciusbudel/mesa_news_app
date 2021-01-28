import 'package:flutter/material.dart';

/**
 * Created by Vinicius Budel on 27,Janeiro,2021
 */
class TxtLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 19,bottom: 221),
        child: Text(
          "NEWS",
          style:
              TextStyle(color: Colors.white, letterSpacing: 25, fontSize: 19),
        ));
  }
}
