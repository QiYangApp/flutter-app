import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:qi_yang/app/config/net_config.dart';

class RouterManage {
  RouterManage._internal();

  static final RouterManage _instance = RouterManage._internal();

  late FluroRouter _router;

  late GlobalKey<NavigatorState> _navigatorKey;

  late String _webViewPage;

  static init() async {
    _instance._router = FluroRouter();
    _instance._navigatorKey = GlobalKey();
    _instance._webViewPage = NetConfig.getWebViewPage();
  }

  static GlobalKey<NavigatorState> getNavigatorStateKey() {
    return _instance._navigatorKey;
  }

  static void setNotFundHandle(Handler handler) {
    _instance._router.notFoundHandler = handler;
  }

  static void setWebViewPage(String path, Handler handler) {
    _instance._router.define(getWebViewPath(path), handler: handler);
  }

  static String getWebViewPath(String path) {
    final webViewPage = _instance._webViewPage;
    return "$webViewPage/$path";
  }

  static FluroRouter getRoute() {
    return _instance._router;
  }
}
