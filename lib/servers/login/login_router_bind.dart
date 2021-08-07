import 'package:QiYang/router/router.dart';
import 'package:QiYang/router/router_path.dart';
import 'package:QiYang/servers/login/page/login_page.dart';
import 'package:fluro/fluro.dart';

class AuthRoute extends AbstractRouteChild {
  @override
  void combination(FluroRouter router) {
    router.define(RouterPath.login_mail, handler: Handler(handlerFunc: (_, __) => LoginPage()));
  }
}
