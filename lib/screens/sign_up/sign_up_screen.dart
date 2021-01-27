import 'package:flutter/material.dart';
import 'package:mesa_news_app/components/custom_text_field.dart';
import 'package:mesa_news_app/constants/colors.dart';
import 'package:mesa_news_app/screens/login/login_screen.dart';
import 'package:mesa_news_app/screens/sign_up/widgets/btn_cadastrar.dart';
import 'package:mesa_news_app/utils/nav.dart';

/**
 * Created by Vinicius Budel on 27,Janeiro,2021
 */
class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final _controllerNome = TextEditingController();
  final _controllerEmail = TextEditingController();
  final _controllerPassword = TextEditingController();
  final _controllerConfirmPassword = TextEditingController();
  final _controllerBirthDate = TextEditingController();

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
                    CustomTextField("Nome", "", _controllerNome),
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
            BtnCadastrar(onClickCadastro, false),
            // BtnLoginFacebook(onClickLoginFacebook, false),
            // SignupBtn()
          ],
        ),
      ),
    );
  }

  void onClickCadastro() {
  }
}
