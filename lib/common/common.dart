import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Lang {
  static const String defaultName = 'lang';
}

class Constant {
  static GlobalKey<ScaffoldState> globalKey= GlobalKey();

  static const int type_sys_update = 1;
  static const int type_refresh_all = 5;

  static const String default_lang = 'zh_CN'; //默认语言包
}

class AppConfig {
  /// debug开关，上线需要关闭
  /// App运行在Release环境时，inProduction为false；当App运行在Debug和Profile环境时，inProduction为true, kReleaseMode
  static const bool inProduction = kDebugMode;

  static bool isDriverTest = true;
  static bool isUnitTest = false;

  static const String appId = 'com.myadream.deer';
  static const String appName = 'deer';
  static const String version = '0.0.1';

  //判断当前是否处在正式环境
  static bool hasProductEnv() {
    return inProduction;
  }

}

class LoadStatus {
  static const int fail = -1;
  static const int loading = 0;
  static const int success = 1;
  static const int empty = 2;
}

