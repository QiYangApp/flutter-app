import 'package:qi_yang/router/router_path.dart';
import 'package:qi_yang/servers/project/page/project_page.dart';
import 'package:fluro/fluro.dart';
import 'package:qi_yang/router/router.dart';

class ProjectRouteBind extends AbstractRouteChild {
  @override
  void combination(FluroRouter router) {
    router.define(RouterPath.project, handler: Handler(handlerFunc: (_, __) => ProjectPage()));
  }
}

