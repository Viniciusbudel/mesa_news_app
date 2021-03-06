import 'package:flutter/material.dart';
import 'package:mesa_news_app/constants/colors.dart';
import 'package:mesa_news_app/screens/sign_up/sign_up_screen.dart';
import 'package:mesa_news_app/utils/nav.dart';

/**
 * Created by Vinicius Budel on 27,Janeiro,2021
 */
class SignupBtn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 32),
      child: GestureDetector(
        onTap: () => push(context, SignUpScreen()),
        child: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: 'Não tenho conta. ',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
              TextSpan(
                text: 'Cadastrar',
                style: TextStyle(
                  color: blueLight,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
