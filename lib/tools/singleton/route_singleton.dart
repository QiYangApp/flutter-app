import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:qi_yang/app/router/router_manage.dart';

class RouteSingleton {
  static void push(BuildContext context, String path,
      {bool replace = false,
        bool clearStack = false,
        TransitionType transition = TransitionType.native}) {
    unfocus();
    RouterManage.getRoute().navigateTo(context, path,
        replace: replace, clearStack: clearStack, transition: transition);
  }

  static void pushResult(
      BuildContext context, String path, Function(Object) function,
      {bool replace = false,
        bool clearStack = false,
        TransitionType transition = TransitionType.native}) {
    unfocus();
    RouterManage.getRoute()
        .navigateTo(context, path,
        replace: replace, clearStack: clearStack, transition: transition)
    .then((value) => function(value));
  }

  /// 返回
  static void goBack(BuildContext context) {
    unfocus();
    Navigator.pop(context);
  }

  /// 带参数返回
  static void goBackWithParams(BuildContext context, Object result) {
    unfocus();
    Navigator.pop<Object>(context, result);
  }

  /// 跳到WebView页
  static void goWebViewPage(BuildContext context, String title, String url) {
    //fluro 不支持传中文,需转换
    push(context,
        '${RouterManage.getWebViewPath("default")}?title=${Uri.encodeComponent(title)}&url=${Uri.encodeComponent(url)}');
  }

  static void unfocus() {
    // 使用下面的方式，会触发不必要的build。
    // FocusScope.of(context).unfocus();
    // https://github.com/flutter/flutter/issues/47128#issuecomment-627551073
    FocusManager.instance.primaryFocus?.unfocus();
  }
}