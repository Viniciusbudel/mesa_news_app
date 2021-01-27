import 'package:flutter/material.dart';
import 'package:mesa_news_app/apis/sign_up_api.dart';
import 'package:mesa_news_app/components/custom_dialog.dart';
import 'package:mesa_news_app/components/custom_text_field.dart';
import 'package:mesa_news_app/constants/colors.dart';
import 'package:mesa_news_app/screens/login/login_screen.dart';
import 'package:mesa_news_app/screens/news/news_screen.dart';
import 'package:mesa_news_app/screens/sign_up/widgets/btn_cadastrar.dart';
import 'package:mesa_news_app/utils/nav.dart';
import 'package:mesa_news_app/utils/prefs.dart';

/**
 * Created by Vinicius Budel on 27,Janeiro,2021
 */
class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final _controllerName = TextEditingController();
  final _controllerEmail = TextEditingController();
  final _controllerPassword = TextEditingController();
  final _controllerConfirmPassword = TextEditingController();
  final _controllerBirthDate = TextEditingController();

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
          "Cadastrar",
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Form(
              key: _formKey,
              child: Container(
                margin: EdgeInsets.fromLTRB(16, 24, 16, 0),
                child: Column(
                  children: [
                    CustomTextField("Nome", "", _controllerName),
                    SizedBox(height: 16),
                    CustomTextField("E-mail", "", _controllerEmail),
                    SizedBox(height: 16),
                    CustomTextField("Senha", "", _controllerPassword,
                        obscure: true),
                    SizedBox(height: 16),
                    CustomTextField(
                        "Confirmar Senha", "", _controllerConfirmPassword,
                        obscure: true),
                    SizedBox(height: 16),
                    CustomTextField("Data de nascimento - opcional", "",
                        _controllerBirthDate),
                  ],
                ),
              ),
            ),
            BtnCadastrar(onClickSignUp, showProgress),
            // BtnLoginFacebook(onClickLoginFacebook, false),
            // SignupBtn()
          ],
        ),
      ),
    );
  }

  Future<void> onClickSignUp() async {
    if (_formKey.currentState.validate()) {
      setState(() {
        showProgress = true;
      });


      String login = _controllerEmail.text;
      String password = _controllerPassword.text;
      String name = _controllerName.text;

      final response = await SignUpApi.signUp(name, login, password);

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
}
