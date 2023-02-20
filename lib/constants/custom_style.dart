import 'package:flutter/material.dart';

Color? primary = const Color(0xFF6246EA);
Color? secondary = const Color(0xFFD1D1E9);
Color? black = const Color(0xFF2B2C34);
Color? white = const Color(0xFFFFFFFE);

ThemeData appTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: primary,
  visualDensity: VisualDensity.adaptivePlatformDensity,
);

class Typo {
  static final title = TextStyle(
    fontWeight: FontWeight.w700,
    color: black,
    fontSize: 24,
  );

  static final paragraph = TextStyle(
    fontWeight: FontWeight.w300,
    color: black,
    fontSize: 10,
  );
}

class Decor {
  static BoxShadow boxShadow = const BoxShadow(
      color: Color.fromRGBO(0, 0, 0, 0.25),
      blurRadius: 12,
      spreadRadius: 0,
      offset: Offset(1, 4));
}
