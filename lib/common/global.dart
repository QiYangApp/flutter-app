import 'dart:io';

import 'package:dio/dio.dart';
import 'package:share_dream/common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:share_dream/router/router.dart';
import 'package:share_dream/util/log_utils.dart';
import 'package:share_dream/util/net/dio_utils.dart';
import 'package:share_dream/bloc/app_bloc_observer.dart';
import 'package:share_dream/util/sp_util.dart';

class Global {
  static void init(VoidCallback callback) async {
    // defaultDebugConfig();
    logInit();
    dioInit();
    routeInit();
    blocObserverInit();

    callback();

    WidgetsFlutterBinding.ensureInitialized();
    await SpUtil.getInstance();

    // setInitDir(initStorageDir: true);

    if (Platform.isAndroid) {
      // 以下两行 设置android状态栏为透明的沉浸。写在组件渲染之后，是为了在渲染后进行set赋值，覆盖状态栏，写在渲染之前MaterialApp组件会覆盖掉这个值。
      SystemUiOverlayStyle systemUiOverlayStyle =
          SystemUiOverlayStyle(statusBarColor: Colors.transparent);
      SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
    }
  }

  static void routeInit() {
    RouterRegister.init();
  }

  static void defaultDebugConfig() {
    debugProfileBuildsEnabled = AppConfig.hasProductEnv();
    debugPaintLayerBordersEnabled = AppConfig.hasProductEnv();
    debugProfilePaintsEnabled = AppConfig.hasProductEnv();
    debugRepaintRainbowEnabled = AppConfig.hasProductEnv();
  }

  //日志
  static Future<void> logInit() async {
    Log.init();
  }

  //网络
  static Future<void> dioInit() async {
    DioInit.init();
  }

  static Future<void> blocObserverInit() async {
    Bloc.observer = AppBlocObserver();
  }
}
