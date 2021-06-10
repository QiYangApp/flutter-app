import 'package:flutter/material.dart';

class ThemeConfig {
  static final ThemeData theme = ThemeData();

  //高亮主题
  static final ThemeData lightTheme = ThemeData.light().copyWith(
      primaryColor: Colors.white,
      accentColor: Colors.white,
      indicatorColor: Colors.white,
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        foregroundColor: Colors.white,
      ),
      brightness: Brightness.light,
      buttonTheme: ButtonThemeData(
          minWidth: 0,
          height: 0,
          padding: EdgeInsets.zero,
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap),
      textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
              minimumSize: MaterialStateProperty.all(Size.zero),
              padding: MaterialStateProperty.all(EdgeInsets.zero),
              tapTargetSize: MaterialTapTargetSize.shrinkWrap))

  , // textTheme: TextTheme(
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