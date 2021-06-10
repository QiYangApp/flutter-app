import 'dart:io';

import 'package:dio/dio.dart';
import 'package:package_info_plus/package_info_plus.dart';
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

    //显示包信息
    packageInfo();

    // setInitDir(initStorageDir: true);


  }

  //app 包信息
  static void packageInfo() {
    PackageInfo.fromPlatform().then((PackageInfo packageInfo) {
      Log.v('App name: ${packageInfo.appName}');
      Log.v('Package name: ${packageInfo.packageName}');
      Log.v('App version: ${packageInfo.version}');
      Log.v('buildNumber: ${packageInfo.buildNumber}');
    });
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
    // DioUtils();
  }

  static Future<void> blocObserverInit() async {
    Bloc.observer = AppBlocObserver();
  }
}
