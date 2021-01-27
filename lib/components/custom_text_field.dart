import 'package:flutter/material.dart';
import 'package:mesa_news_app/constants/styles.dart';

/**
 * Created by Vinicius Budel on 27,Janeiro,2021
 */
class CustomTextField extends StatelessWidget {
  final String title;
  final String hint;
  final bool obscure;
  final TextEditingController controller;


  CustomTextField(this.title, this.hint, this.controller, {this.obscure = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          title,
          style: labelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: boxDecorationStyle,
          height: 60.0,
          child: Focus(
            child: TextFormField(
              validator: (text) => _validar(text),
              controller: controller,
              obscureText: obscure,
              style: fieldTextStyle,
              decoration: InputDecoration(
                errorStyle: TextStyle(
                  color: Colors.white,
                  backgroundColor: Colors.red,
                  fontSize: 10.0,
                ),
                border: InputBorder.none,
                hintText: hint,
                hintStyle: hintTextStyle,
              ),
            ),
          ),
        ),
      ],
    );
  }

  String _validar(String value) {
    if (value.isEmpty) {
      return 'Digite algo, por favor!';
    }
  }
}
