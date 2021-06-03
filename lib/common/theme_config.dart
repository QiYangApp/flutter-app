import 'package:flutter/material.dart';

class ThemeConfig {
  static final ThemeData theme = ThemeData();

  //高亮主题
  static final ThemeData lightTheme = ThemeData.light().copyWith(
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      foregroundColor: Colors.white,
    ),
    brightness: Brightness.light,
    // textTheme: TextTheme(
    //     caption: TextStyle(color: Colors.black),
    //     overline: TextStyle(color: Colors.black),
    //     bodyText1: TextStyle(color: Colors.black),
    //     button: TextStyle(fontSize: 45, color: Colors.black)
    // ),
  );

  //暗黑主题
  static final ThemeData darkTheme = ThemeData.dark().copyWith(
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      foregroundColor: Colors.black,
    ),
    brightness: Brightness.dark,
    // textTheme: TextTheme(
    //     // button: TextStyle(fontSize: 45)
    // ),
  );

}