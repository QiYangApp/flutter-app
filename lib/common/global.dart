import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bugly/flutter_bugly.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_ume/flutter_ume.dart'; // UME 框架
import 'package:flutter_ume_kit_console/flutter_ume_kit_console.dart'; // debugPrint 插件包
import 'package:flutter_ume_kit_device/flutter_ume_kit_device.dart'; // 设备信息插件包
import 'package:flutter_ume_kit_perf/flutter_ume_kit_perf.dart'; // 性能插件包
import 'package:flutter_ume_kit_show_code/flutter_ume_kit_show_code.dart'; // 代码查看插件包
import 'package:flutter_ume_kit_ui/flutter_ume_kit_ui.dart'; // UI 插件包
import 'package:jpush_flutter/jpush_flutter.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:qi_yang/bloc/app_bloc_observer.dart';
import 'package:qi_yang/common/common.dart';
import 'package:qi_yang/router/router.dart';
import 'package:qi_yang/util/log_utils.dart';
import 'package:qi_yang/util/net/dio_utils.dart';
import 'package:qi_yang/util/sp_util.dart';

class Global {
  static void init(VoidCallback callback) async {
    logInit();

    // defaultDebugConfig();
    await configInit();

    //存储
    await store();

    dioInit();
    routeInit();
    blocObserverInit();

    //显示包信息
    packageInfo();
    //极光推送
    jpushInit();

    if (AppConfig.hasProductEnv()) {
      return callback();
    }

    //配置 bugly
    // FlutterBugly.postCatchedException(callback());
    // bugly()

    //debug 工具
    // ume();
    // injectUMEWidget(enable: true, child: callback());
    callback();
  }

  //调试工具
  static void ume() async {
    PluginManager.instance // 注册插件
      ..register(WidgetInfoInspector())
      ..register(WidgetDetailInspector())
      ..register(ColorSucker())
      ..register(AlignRuler())
      ..register(Performance())
      ..register(ShowCode())
      ..register(MemoryInfoPage())
      ..register(CpuInfoPage())
      ..register(DeviceInfoPanel())
      ..register(Console());
  }

  //杂项加载
  static void other() async {
    EasyLoading.init();
  }

  static void bugly() {
    FlutterBugly.init(androidAppId: "e304fd4b3cg", iOSAppId: "your iOS app id")
        .then((value) {
      Log.v(value.message, tag: "bugly");
      Log.v(value.isSuccess, tag: "bugly");
    });
  }

  //app 包信息
  static void packageInfo() async {
    Log.startLog("packageInfo");

    PackageInfo.fromPlatform().then((PackageInfo packageInfo) {
      Log.v('App name: ${packageInfo.appName}');
      Log.v('Package name: ${packageInfo.packageName}');
      Log.v('App version: ${packageInfo.version}');
      Log.v('buildNumber: ${packageInfo.buildNumber}');
    });
  }

  static void routeInit() async {
    Log.startLog("routeInit");
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
    Log.startLog("dioInit");

    DioInit.init();
  }

  //本地存储
  static Future<void> store() async {
    Log.startLog("store");

    SpUtil.getInstance();
  }

  //配置文件
  static Future<void> configInit() async {
    Log.startLog("configInit");

    WidgetsFlutterBinding.ensureInitialized();
    await FlutterConfig.loadEnvVariables();
  }

  static Future<void> blocObserverInit() async {
    BlocOverrides.runZoned(
      () {
        // Use cubits...
      },
      blocObserver: AppBlocObserver(),
    );
  }

  //启动极光推送
  static Future<void> jpushInit() async {
    Log.startLog("jpushInit");

    JPush jpush = new JPush();
    jpush.addEventHandler(
      // 接收通知回调方法。
      onReceiveNotification: (Map<String, dynamic> message) async {
        print("flutter onReceiveNotification: $message");
      },
      // 点击通知回调方法。
      onOpenNotification: (Map<String, dynamic> message) async {
        print("flutter onOpenNotification: $message");
      },
      // 接收自定义消息回调方法。
      onReceiveMessage: (Map<String, dynamic> message) async {
        print("flutter onReceiveMessage: $message");
      },
    );

    jpush.setup(debug: false);
    jpush.applyPushAuthority();
  }
}
