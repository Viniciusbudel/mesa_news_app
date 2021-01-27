import 'package:flutter/material.dart';
import 'package:mesa_news_app/constants/colors.dart';

final hintTextStyle = TextStyle(
  letterSpacing: 1.0,
  fontSize: 14.0,

  color: blueMain,
);

final fieldTextStyle = TextStyle(
  fontSize: 16.0,
  color: blueMain,
);

final labelStyle = TextStyle(
  color: blueMain,
  fontWeight: FontWeight.bold,
);

final boxDecorationStyle = BoxDecoration(
  color: fieldColor,
  borderRadius: BorderRadius.circular(5.0),
  // boxShadow: [
  //   BoxShadow(
  //     color: Colors.white70,
  //     blurRadius: 6.0,
  //     offset: Offset(0, 2),
  //   ),
  // ],
);

final boxDecorationRequiredStyle = BoxDecoration(
  color: Colors.yellow[50],
  borderRadius: BorderRadius.circular(5.0),
  // boxShadow: [
  //   BoxShadow(
  //     color: Colors.white70,
  //     blurRadius: 6.0,
  //     offset: Offset(0, 2),
  //   ),
  // ],
);
