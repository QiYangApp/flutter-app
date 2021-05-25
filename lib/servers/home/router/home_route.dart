import 'package:fluro/fluro.dart';
import 'package:share_dream/router/router.dart';
import 'package:share_dream/servers/home/page/home_page.dart';

class HomeRoutePath {
  static final String home = 'home';
}

class HomeRoute extends AbstractRouteChild {
  @override
  void combination(FluroRouter router) {
    router.define(HomeRoutePath.home, handler: Handler(handlerFunc: (_, __) => HomePage()));
  }
}

