import 'package:flutter/material.dart';

class ThemeConfig {
  static final ThemeData theme = ThemeData();

  //高亮主题
  static final ThemeData lightTheme = ThemeData.light().copyWith(
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    hoverColor: Colors.transparent,
    iconTheme: IconThemeData(color: Colors.black),
    textTheme: const TextTheme(
      headline1: TextStyle(color: Colors.black),
      headline2: TextStyle(color: Colors.black),
      headline3: TextStyle(color: Colors.black),
      headline4: TextStyle(color: Colors.black),
      headline5: TextStyle(color: Colors.black),
      headline6: TextStyle(color: Colors.black),
      bodyText1: TextStyle(color: Colors.black),
      bodyText2: TextStyle(color: Colors.black),
    ),
    primaryColor: Colors.white,
    accentColor: Colors.white,
    indicatorColor: Colors.white,
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      foregroundColor: Colors.white,
    ),
    brightness: Brightness.light,
    buttonTheme: ButtonThemeData(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        hoverColor: Colors.transparent,
        minWidth: 0,
        height: 0,
        padding: EdgeInsets.zero,
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap),
    textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
            //设置按钮上字体与图标的颜色
            //foregroundColor: MaterialStateProperty.all(Colors.deepPurple),
            //更优美的方式来设置
            foregroundColor: MaterialStateProperty.resolveWith(
              (states) {
                if (states.contains(MaterialState.focused) &&
                    !states.contains(MaterialState.pressed)) {
                  //获取焦点时的颜色
                  return null;
                } else if (states.contains(MaterialState.pressed)) {
                  //按下时的颜色
                  return null;
                }
                //默认状态使用灰色
                return null;
              },
            ),
            //背景颜色
            backgroundColor: MaterialStateProperty.resolveWith((states) {
              //设置按下时的背景颜色
              if (states.contains(MaterialState.pressed)) {
                return Colors.transparent;
              }
              //默认不使用背景颜色
              return null;
            }),
            //设置水波纹颜色
            overlayColor: MaterialStateProperty.all(Colors.transparent),
            minimumSize: MaterialStateProperty.all(Size.zero),
            padding: MaterialStateProperty.all(EdgeInsets.zero),
            tapTargetSize:
                MaterialTapTargetSize.shrinkWrap)), // textTheme: TextTheme(
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
