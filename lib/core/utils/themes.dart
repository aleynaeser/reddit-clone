import 'package:flutter/material.dart';
import 'package:reddit_clone/core/utils/constants.dart';

class Themes {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    primarySwatch: Colors.orange,
    primaryColor: white,
    scaffoldBackgroundColor: white,
    iconTheme: const IconThemeData(color: grey),
    textTheme: const TextTheme(
      //AppBar
      headline1: TextStyle(
          fontSize: titleFontSize, fontWeight: FontWeight.bold, color: black),
      //bodyText
      bodyText1: TextStyle(color: black, fontSize: bodyFontSize),
    ),
  );
}
