import 'package:flutter/material.dart';

/**
 * Created by Vinicius Budel on 27,Janeiro,2021
 */
class ImgSignIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 40),
        child: Image.asset(
          "assets/images/ic_login.png",
          fit: BoxFit.cover,
          width: 120,
          height: 119,
        ));
  }
}
