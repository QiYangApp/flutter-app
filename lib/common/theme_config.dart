import 'package:flutter/material.dart';

class ThemeConfig {
  static final ThemeData theme = ThemeData();

  //高亮主题
  static final ThemeData lightTheme = ThemeData.light().copyWith(
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      foregroundColor: Colors.white,
    ),
    brightness: Brightness.light,
    // textTheme: TextTheme().copyWith(
    //     button: TextStyle(fontSize: 45)
    // ),
  );

  //暗黑主题
  static final ThemeData darkTheme = ThemeData.light().copyWith(
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      foregroundColor: Colors.black,
    ),
    brightness: Brightness.dark,
    textTheme: TextTheme(
        // button: TextStyle(fontSize: 45)
    ),
  );

}