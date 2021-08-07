import 'package:QiYang/router/router.dart';
import 'package:QiYang/router/router_path.dart';
import 'package:QiYang/servers/home/page/home_page.dart';
import 'package:fluro/fluro.dart';

class HomeRouterBind extends AbstractRouteChild {
  @override
  Future<void> combination(FluroRouter router) async {
    //入口
    router.define(RouterPath.home, handler: Handler(handlerFunc: (_, __) => HomePage()));
  }
}
