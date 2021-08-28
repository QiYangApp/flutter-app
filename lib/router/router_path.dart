abstract class RouterPath {
  //主入口
  static const String entry = 'entry';

  //首页
  static const String home = 'home';

  //邮箱登录
  static const String login_mail = 'auth/login/mail';

  //文章分类列表
  static const String article_classify = 'article/classify';

  //文章详情基础路径
  static const String article_detail_path = 'article/detail/';

  //文章详情
  static const String article_detail = article_detail_path + ':id';

  //项目
  static const String project = 'project';

  //用户页面
  static const String user = 'user';
}
