import 'package:fluro/fluro.dart';

abstract class AbstractRouteChild {
  ///统一调用注册
  void initRoute(FluroRouter router) {
    combination(router);
  }

  ///由子路由继承进行实现。在该函数中注册， 可在函数中通过请求判断是否进行该模块路由注册
  void combination(FluroRouter router);
}