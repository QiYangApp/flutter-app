import 'package:QiYang/servers/project/page/project_page.dart';
import 'package:fluro/fluro.dart';
import 'package:QiYang/router/router.dart';

class ProjectRoutePath {
  static const String project = 'project';
}

class ProjectRoute extends AbstractRouteChild {
  @override
  void combination(FluroRouter router) {
    router.define(ProjectRoutePath.project, handler: Handler(handlerFunc: (_, __) => ProjectPage()));
  }
}

