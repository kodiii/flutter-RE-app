import 'package:flutter/material.dart';

class AppFonts {
  static const String primaryFont = 'Roboto';

  static const TextStyle heading1 = TextStyle(
    fontFamily: primaryFont,
    fontSize: 32.0,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );

  static const TextStyle heading2 = TextStyle(
    fontFamily: primaryFont,
    fontSize: 24.0,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );

  static const TextStyle bodyText1 = TextStyle(
    fontFamily: primaryFont,
    fontSize: 16.0,
    color: Colors.black,
  );

  static const TextStyle bodyText2 = TextStyle(
    fontFamily: primaryFont,
    fontSize: 14.0,
    color: Colors.black,
  );
}