import 'package:flutter_config/flutter_config.dart';

//
class JpushConfig {
  static final String jPushAppKey =
      FlutterConfig.get('JPUSH_APPKEY').toString();

  static final String jPushChannel =
      FlutterConfig.get('JPUSH_CHANNEL').toString();

  static final String jPushDebug = FlutterConfig.get('JPUSH_DEBUG').toString();

  static final String jPushProduction =
      FlutterConfig.get('JPUSH_PRODUCTION').toString();

  static bool getJPushDebug()
  {
    return jPushDebug == 'true';
  }

  static bool getJPushProduction()
  {
    return jPushProduction == 'true';
  }
}
