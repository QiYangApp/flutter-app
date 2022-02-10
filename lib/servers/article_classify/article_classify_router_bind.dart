import 'package:qi_yang/router/router.dart';
import 'package:qi_yang/router/router_path.dart';
import 'package:qi_yang/servers/article_classify/page/article_classify_page.dart';
import 'package:qi_yang/servers/article_classify/page/article_detail_page.dart';
import 'package:fluro/fluro.dart';

class ArticleClassifyRouteBind extends AbstractRouteChild {
  @override
  void combination(FluroRouter router) {
    //文章分类
    router.define(RouterPath.article_classify,
        handler: Handler(handlerFunc: (_, __) => ArticleClassifyPage()));

    //文章详情
    router.define(RouterPath.article_detail,
        handler: Handler(
            handlerFunc: (_, params) =>
                ArticleDetailPage(articleId: params['id'][0])));
  }
}
