import 'package:flutter/material.dart';
import 'package:mesa_news_app/constants/colors.dart';
import 'package:mesa_news_app/screens/login/widgets/btn_login.dart';
import 'package:mesa_news_app/screens/login/widgets/btn_login_facebook.dart';
import 'package:mesa_news_app/screens/login/widgets/img_logo.dart';
import 'package:mesa_news_app/screens/login/widgets/signup_btn.dart';
import 'package:mesa_news_app/screens/login/widgets/txt_logo.dart';
import 'package:mesa_news_app/screens/sign_in/sign_in_screen.dart';
import 'package:mesa_news_app/utils/nav.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blueMain,
      body: Center(
        child: SingleChildScrollView (
          child: Column(
            children: [
              ImgLogo(),
              TxtLogo(),
              BtnLoginFacebook("Entrar com facebook", onClickLoginFacebook, false),
              BtnLogin("Entrar com e-mail",onClickLogin,false),
              SignupBtn(),
            ],
          ),
        ),
      ),
    );
  }

  void Function() onClickLoginFacebook() {}

  void Function() onClickLogin() {
    push(context, SingInScreen());
  }
}
