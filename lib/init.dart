import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_ume/flutter_ume.dart'; // UME 框架
import 'package:flutter_ume_kit_ui/flutter_ume_kit_ui.dart'; // UI 插件包
import 'package:flutter_ume_kit_perf/flutter_ume_kit_perf.dart'; // 性能插件包
import 'package:flutter_ume_kit_show_code/flutter_ume_kit_show_code.dart'; // 代码查看插件包
import 'package:flutter_ume_kit_device/flutter_ume_kit_device.dart'; // 设备信息插件包
import 'package:flutter_ume_kit_console/flutter_ume_kit_console.dart'; // debugPrint 插件包
import 'package:flutter_ume_kit_dio/flutter_ume_kit_dio.dart';
import 'package:jpush_flutter/jpush_flutter.dart';
import 'package:qi_yang/app/config/jpush_config.dart';
import 'package:qi_yang/app/net/dio/dio_manage.dart';
import 'package:qi_yang/app/net/http_repository_manage.dart';
import 'package:qi_yang/tools/singleton/log_singleton.dart';
import 'package:qi_yang/tools/singleton/sp_singleton.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:package_info_plus/package_info_plus.dart';

import 'app/bloc/app_bloc_observer.dart';
import 'app/config/app_config.dart';
import 'app/router/router_manage.dart';
import 'app/router/router_register.dart';

class Init {
  static Future<void> init(VoidCallback callback) async {
    await _registerLogger();
    await _registerConfig();
    await _registerStore();

    await _registerNet();
    await _registerUme(DioManage.getDio());
    await _registerBlocObserver();
    await _registerRoute();

    _registerJPush();
    _platformInfo();

    return callback();
  }

  //页面适配
  static Future<void> registerView(BuildContext context) async {
    ScreenUtil.init(
        BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width,
            maxHeight: MediaQuery.of(context).size.height),
        designSize: const Size(360, 690),
        orientation: Orientation.portrait);
  }

  //网络部分
  static Future<void> _registerNet() async {
    await DioManage.init();
    await HttpRepositoryManage.init();
  }

  //app 平台信息
  static void _platformInfo() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    LogSingleton.i(packageInfo);
  }

  //本地文件存储
  static Future<void> _registerStore() async {
    await SpSingleton.init();
  }

  //注册配置
  static Future<void> _registerConfig() async {
    WidgetsFlutterBinding.ensureInitialized(); // Required by FlutterConfig
    await FlutterConfig.loadEnvVariables();
  }

  //注册日志
  static Future<void> _registerLogger() async {
    if (AppConfig.hasDevelopmentEnv()) {
      await LogSingleton.init();
    }
  }

  static Future<void> _registerBlocObserver() async {
    BlocOverrides.runZoned(() {},
      blocObserver: AppBlocObserver(),
    );
  }

  //
  static Future<void> _registerRoute() async {
    await RouterManage.init();
    await RouterRegister.init();
  }

  //注册 ume debug
  static Future<void> _registerUme(Dio? dio) async {
    if (AppConfig.hasDevelopmentEnv() && dio != null) {
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

  //极光推送
  static Future<void> _registerJPush() async {
    final JPush jpush = JPush();
    jpush.addEventHandler(
      // 接收通知回调方法。
      onReceiveNotification: (Map<String, dynamic> message) async {
        LogSingleton.i("flutter onReceiveNotification: $message");
      },
      // 点击通知回调方法。
      onOpenNotification: (Map<String, dynamic> message) async {
        LogSingleton.i("flutter onOpenNotification: $message");
      },
      // 接收自定义消息回调方法。
      onReceiveMessage: (Map<String, dynamic> message) async {
        LogSingleton.i("flutter onReceiveMessage: $message");
      },
    );

    jpush.setup(
      appKey: JpushConfig.jPushAppKey,
      channel: JpushConfig.jPushChannel,
      production: JpushConfig.getJPushDebug(),
      debug: JpushConfig.getJPushProduction()
    );

  }
}
