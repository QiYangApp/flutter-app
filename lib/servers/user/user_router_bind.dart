import 'package:qi_yang/router/router.dart';
import 'package:qi_yang/router/router_path.dart';
import 'package:qi_yang/servers/user/page/user_page.dart';
import 'package:fluro/fluro.dart';

class UserRouterBind extends AbstractRouteChild {
  @override
  void combination(FluroRouter router) {
    //用户页面
    router.define(RouterPath.user, handler: Handler(handlerFunc: (_, __) => UserPage()));
  }

}