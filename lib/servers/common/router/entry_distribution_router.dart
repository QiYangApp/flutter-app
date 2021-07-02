import 'package:fluro/fluro.dart';
import 'package:QiYang/router/router.dart';
import 'package:QiYang/servers/common/page/entry_distribution_page.dart';

class EntryDistributionRoutePath {
  static const String entry_distribution = 'entry_distribution';
}

class EntryDistributionRoute extends AbstractRouteChild {
  @override
  void combination(FluroRouter router) {
    router.define(EntryDistributionRoutePath.entry_distribution, handler: Handler(handlerFunc: (_, __) => EntryDistributionPage()));
  }
}