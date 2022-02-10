import 'package:qi_yang/router/router.dart';
import 'package:qi_yang/router/router_path.dart';
import 'package:qi_yang/servers/login/page/login_page.dart';
import 'package:fluro/fluro.dart';

class AuthRouteBind extends AbstractRouteChild {
  @override
  void combination(FluroRouter router) {
    router.define(RouterPath.login_mail, handler: Handler(handlerFunc: (_, __) => LoginPage()));
  }
}
