import 'package:flutter/material.dart';
import 'package:mesa_news_app/apis/login_api.dart';
import 'package:mesa_news_app/components/custom_dialog.dart';
import 'package:mesa_news_app/components/custom_text_field.dart';
import 'package:mesa_news_app/constants/colors.dart';
import 'package:mesa_news_app/constants/styles.dart';
import 'package:mesa_news_app/screens/login/login_screen.dart';
import 'package:mesa_news_app/screens/news/news_screen.dart';
import 'package:mesa_news_app/screens/sign_in/widgets/btn_login.dart';
import 'package:mesa_news_app/screens/sign_in/widgets/btn_login_facebook.dart';
import 'package:mesa_news_app/screens/sign_in/widgets/img_sign_in.dart';
import 'package:mesa_news_app/screens/sign_in/widgets/signup_btn.dart';
import 'package:mesa_news_app/utils/nav.dart';
import 'package:mesa_news_app/utils/prefs.dart';

class SingInScreen extends StatefulWidget {
  @override
  _SingInScreenState createState() => _SingInScreenState();
}

class _SingInScreenState extends State<SingInScreen> {
  final _formKey = GlobalKey<FormState>();
  final _controllerLogin = TextEditingController();
  final _controllerPassword = TextEditingController();


  bool showProgress = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.close),
          onPressed: () {
            push(context, LoginScreen());
          },
        ),
        backgroundColor: blueMain,
        title: Text(
          "Entrar com e-mail",
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              ImgSignIn(),
              Form(
                key: _formKey,
                child: Container(
                  margin: EdgeInsets.fromLTRB(16, 55, 16, 0),
                  child: Column(
                    children: [
                      CustomTextField("E-mail", "", _controllerLogin),
                      SizedBox(height: 16),
                      CustomTextField("Senha", "", _controllerPassword,
                          obscure: true),
                    ],
                  ),
                ),
              ),
              BtnLogin(onClickLogin, showProgress),
              BtnLoginFacebook(onClickLoginFacebook, false),
              SignupBtn()
            ],
          ),
        ),
      ),
    );
  }

  Future<void> onClickLogin() async {

    if (_formKey.currentState.validate()) {
      setState(() {
        showProgress = true;
      });
      String login = _controllerLogin.text;
      String password = _controllerPassword.text;

      final response = await LoginApi.login(login, password);

      if (response.ok) {
        String token = response.result;
        Prefs.setString("token", token);

        push(context, NewsScreen());
      } else {
        DialogUtils.showCustomDialog(context,
            title: response.msg,
            okBtnText: "Ok",
            cancelBtnText: "",
            okBtnFunction: () => Navigator.pop(context) //Fazer algo
          //Fazer algo
        );
      }
      setState(() {
        showProgress = false;
      });
    }
  }

  void onClickLoginFacebook() {}
}
