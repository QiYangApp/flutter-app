import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:qi_yang/app/router/router_manage.dart';
import 'package:qi_yang/app/router/views/not_found_page.dart';
import 'package:qi_yang/app/router/views/web_view_page.dart';
import 'package:qi_yang/views/login/login_route.dart';

class RouterRegister {
  static init() async {
    _initNotFundHandle();
    _initWebViewPage();

    //添加登陆路由
    RouterManage.addRoute(LoginRoute());
  }

  //创建默认不存在的路由页面
  static void _initNotFundHandle() {
    RouterManage.setNotFundHandle(Handler(
        handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
      debugPrint('未找到目标页');
      return const NotFoundPage();
    }));
  }

  //创建默认webView
  static void _initWebViewPage() {
    RouterManage.setWebViewPage("default", Handler(handlerFunc: (_, params) {
      final String? title = params['title']?.first;
      final String? url = params['url']?.first;
      return WebViewPage(title: title ?? '', url: url ?? '');
    }));
  }
}
