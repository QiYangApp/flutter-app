import 'package:qi_yang/router/router.dart';
import 'package:qi_yang/router/router_path.dart';
import 'package:qi_yang/servers/common/page/entry_distribution_page.dart';
import 'package:fluro/fluro.dart';

class CommonRouterBind extends AbstractRouteChild {
  @override
  void combination(FluroRouter router) {
    //入口
    router.define(RouterPath.entry, handler: Handler(handlerFunc: (_, __) => EntryDistributionPage()));
  }
}