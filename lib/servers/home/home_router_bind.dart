import 'package:qi_yang/router/router.dart';
import 'package:qi_yang/router/router_path.dart';
import 'package:qi_yang/servers/home/page/home_page.dart';
import 'package:fluro/fluro.dart';

class HomeRouterBind extends AbstractRouteChild {
  @override
  Future<void> combination(FluroRouter router) async {
    //入口
    router.define(RouterPath.home, handler: Handler(handlerFunc: (_, __) => HomePage()));
  }
}
