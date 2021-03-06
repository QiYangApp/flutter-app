import 'package:qi_yang/servers/article_classify/article_classify_router_bind.dart';
import 'package:qi_yang/servers/common/common_router_bind.dart';
import 'package:qi_yang/servers/home/home_router_bind.dart';
import 'package:qi_yang/servers/login/login_router_bind.dart';
import 'package:qi_yang/servers/project/project_router_bind.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:qi_yang/servers/common/page/not_fund_page.dart';
import 'package:qi_yang/servers/common/page/webview_page.dart';

///抽象子路由
abstract class AbstractRouteChild {

  ///统一调用注册
  void initRoute(FluroRouter router) {
    combination(router);
  }

  ///由子路由继承进行实现。在该函数中注册， 可在函数中通过请求判断是否进行该模块路由注册
  void combination(FluroRouter router);
}

//基础路由
class BaseRouter {
  static String _webViewPage = '/webView';

  static final FluroRouter route = FluroRouter();

  static GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  static void addRoute(AbstractRouteChild child) {
    child.initRoute(route);
  }

  static void setNotFundHandle(Handler handler) {
    route.notFoundHandler = handler;
  }

  static void setWebViewPage(String path, Handler handler) {
    route.define(getWebViewPath(path), handler: handler);
  }

  static String getWebViewPath(String path) {
    return "$_webViewPage/$path";
  }
}

///公共路由注册
class RouterRegister {

  static void init() {
    //注册首页路由
    BaseRouter.addRoute(HomeRouterBind());

    //注册全局导航
    BaseRouter.addRoute(CommonRouterBind());

    //注册全局导航
    BaseRouter.addRoute(ProjectRouteBind());

    //注册全局导航
    BaseRouter.addRoute(ArticleClassifyRouteBind());

    //添加授权路由
    BaseRouter.addRoute(AuthRouteBind());

    initNotFundHandle();
    initWebViewPage();
  }

  //创建默认不存在的路由页面
  static void initNotFundHandle() {
    BaseRouter.setNotFundHandle(Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) {
          debugPrint('未找到目标页');
          return NotFoundPage();
        }));
  }

  //创建默认webView
  static void initWebViewPage() {
    BaseRouter.setWebViewPage("default", Handler(handlerFunc: (_, params) {
      final String title = params['title']?.first;
      final String url = params['url']?.first;
      return WebViewPage(title: title, url: url);
    }));

  }
}