import 'package:flutter/material.dart';

/**
 * Created by Vinicius Budel on 27,Janeiro,2021
 */
class ImgLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      "assets/images/logo_mesa.png",
      fit: BoxFit.cover,
      width: 116,
      height: 101,
    );
  }
}
