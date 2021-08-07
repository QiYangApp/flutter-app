import 'package:QiYang/router/router.dart';
import 'package:QiYang/servers/article_classify/page/article_classify.dart';
import 'package:fluro/fluro.dart';

class ArticleClassifyRoutePath {
  //文章列表
  static const list = 'article/classify';

  //热点文章
  static const listHost = 'article/hot';
}

class ArticleClassifyRoute extends AbstractRouteChild {
  @override
  void combination(FluroRouter router) {
    router.define(ArticleClassifyRoutePath.list,
        handler: Handler(handlerFunc: (_, __) => ArticleClassify()));
  }
}
