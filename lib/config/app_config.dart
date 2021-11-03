import 'package:flutter/foundation.dart';

class AppConfig {
  /// debug开关，上线需要关闭
  /// App运行在Release环境时，inProduction为false；当App运行在Debug和Profile环境时，inProduction为true, kReleaseMode
  static const bool inProduction = kDebugMode;

  static bool isDriverTest = true;
  static bool isUnitTest = false;

  static const String appId = 'com.myadream.qiyang';
  static const String appName = 'qiyang';
  static const String version = '0.0.1';

  //判断当前是否处在正式环境
  static bool hasProductEnv() {
    return inProduction;
  }

  static bool hasDevelopmentEnv() {
    return !hasProductEnv();
  }
}