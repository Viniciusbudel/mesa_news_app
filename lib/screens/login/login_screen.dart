import 'package:flutter/material.dart';
import 'package:mesa_news_app/constants/colors.dart';
import 'package:mesa_news_app/screens/login/widgets/img_logo.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blueMain,
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(130, 230, 130, 0),
            child: ImgLogo(),
          )
        ],
      ),
    );
  }
}
