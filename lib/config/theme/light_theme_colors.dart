import 'package:flutter/material.dart';

class LightThemeColors {
  //dark swatch
  static const Color primaryColor = Colors.teal;
  static Color primaryColorDarker = Colors.teal.shade800;
  static const Color secondary = Color.fromARGB(255, 104, 239, 174);
  static const Color focusColor = Color.fromARGB(255, 18, 17, 17);
  static const MaterialAccentColor accentColor = Colors.amberAccent;

  //text Color

  static const Color textColor = Color.fromRGBO(0, 21, 7, 1);

  static const Color btColor1 = Color.fromRGBO(27, 74, 42, 1.0);
  static const Color btColor2 = Color.fromRGBO(5, 108, 38, 1.0);

  static const Color btColor3 = Color.fromRGBO(125, 208, 112, 1.0);
  static const Color btColor4 = Color.fromRGBO(250, 225, 2, 1);

  //APPBAR
  static const Color appBarColor = primaryColor;

  //SCAFFOLD
  static const Color scaffoldBackgroundColor =
      Color.fromARGB(255, 255, 255, 255);
  static const Color backgroundColor = Color.fromRGBO(12, 19, 29, 1);
  static const Color dividerColor = Color(0xff686868);
  static const Color cardColor = Color.fromARGB(172, 228, 228, 228);

  static const Color canvasColor = scaffoldBackgroundColor;

  //ICONS
  static const Color appBarIconsColor = Colors.white;
  static const Color iconColor = Colors.black;

  //BUTTON
  static const Color buttonColor = primaryColor;
  static const Color buttonTextColor = Colors.white;
  static const Color buttonDisabledColor = Colors.grey;
  static const Color buttonDisabledTextColor = Colors.black;
  static const Color redColour = Colors.red;

  //TEXT
  static const Color bodyTextColor = textColor;
  static const Color headlinesTextColor = textColor;
  static const Color captionTextColor = Colors.grey;
  static const Color hintTextColor = Color.fromRGBO(38, 48, 63, 1);

  //chip
  static const Color chipBackground = primaryColor;
  static const Color chipTextColor = Colors.white;

  // progress bar indicator
  static const Color progressIndicatorColor = primaryColor;
}
