import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ume/flutter_ume.dart'; // UME 框架
import 'package:flutter_ume_kit_ui/flutter_ume_kit_ui.dart'; // UI 插件包
import 'package:flutter_ume_kit_perf/flutter_ume_kit_perf.dart'; // 性能插件包
import 'package:flutter_ume_kit_show_code/flutter_ume_kit_show_code.dart'; // 代码查看插件包
import 'package:flutter_ume_kit_device/flutter_ume_kit_device.dart'; // 设备信息插件包
import 'package:flutter_ume_kit_console/flutter_ume_kit_console.dart'; // debugPrint 插件包
import 'package:flutter_ume_kit_dio/flutter_ume_kit_dio.dart';
import 'package:qi_yang/tools/singleton/log_singleton.dart';
import 'package:qi_yang/tools/singleton/sp_singleton.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:package_info_plus/package_info_plus.dart';

import 'app/config/app_config.dart';

class Init {
  static void init(VoidCallback callback) async {
    await _registerLogger();
    await _registerConfig();
    await _registerStore();
    // await _registerUme(dio);

    callback();
  }

  //app 平台信息
  static void platformInfo() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    LogSingleton.i(packageInfo);
  }

  //本地文件存储
  static Future<void> _registerStore() async {
    await SpSingleton.getInstance();
  }

  //注册配置
  static Future<void> _registerConfig() async {
    WidgetsFlutterBinding.ensureInitialized(); // Required by FlutterConfig
    await FlutterConfig.loadEnvVariables();
  }

  //注册日志
  static Future<void>  _registerLogger() async {
    if (AppConfig.hasDevelopmentEnv()) {
      await LogSingleton.getInstance();
    }
  }

  //注册 ume debug
  Future<void> _registerUme(Dio dio) async {
    if (AppConfig.hasDevelopmentEnv()) {
      PluginManager.instance
        ..register(const WidgetInfoInspector())
        ..register(const WidgetDetailInspector())
        ..register(const ColorSucker())
        ..register(AlignRuler())
        ..register(Performance())
        ..register(const ShowCode())
        ..register(const MemoryInfoPage())
        ..register(CpuInfoPage())
        ..register(const DeviceInfoPanel())
        ..register(Console())
        ..register(DioInspector(dio: dio));
    }
  }
}
