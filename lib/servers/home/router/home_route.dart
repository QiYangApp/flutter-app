import 'package:fluro/fluro.dart';
import 'package:QiYang/router/router.dart';
import 'package:QiYang/servers/home/page/home_page.dart';

class HomeRoutePath {
  static const String home = 'home';
  static const String me = 'me';
}

class HomeRoute extends AbstractRouteChild {
  @override
  void combination(FluroRouter router) {
    router.define(HomeRoutePath.home, handler: Handler(handlerFunc: (_, __) => HomePage()));

    // router.define(HomeRoutePath.me, handler: Handler(handlerFunc: (_, __) => MePage()));
  }
}

