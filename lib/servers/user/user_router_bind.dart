import 'package:QiYang/router/router.dart';
import 'package:QiYang/router/router_path.dart';
import 'package:QiYang/servers/user/page/user_page.dart';
import 'package:fluro/fluro.dart';

class UserRouterBind extends AbstractRouteChild {
  @override
  void combination(FluroRouter router) {
    //用户页面
    router.define(RouterPath.user, handler: Handler(handlerFunc: (_, __) => UserPage()));
  }

}