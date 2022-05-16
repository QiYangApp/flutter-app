import 'package:fluro/fluro.dart';
import 'package:qi_yang/app/router/abstract_route_child.dart';
import 'package:qi_yang/app/router/route_const.dart';
import 'package:qi_yang/views/login/login_view.dart';

class LoginRoute extends AbstractRouteChild {
  @override
  void combination(FluroRouter router) {
    router.define(RouteConst.login, handler: Handler(handlerFunc: (_, __) => const LoginView()));
  }
}