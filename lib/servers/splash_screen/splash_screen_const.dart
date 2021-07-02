import 'package:QiYang/r.dart';
import 'package:QiYang/servers/home/router/home_route.dart';
import 'package:QiYang/servers/splash_screen/model/splash_screen_model_index.dart';

//引导页
class GuidePageConst {
  //数据存储可以
  static const String key = 'key_guide';

  //读取状态
  static const String key_read_status = 'key_guide_read_status';

  static final GuidePageModel guidePageModel = GuidePageModel(
      updatedAt: '1989-07-17 15:23:17',
      images: [
        Images(
            title: "默认标题",
            description: "说明",
            order: 1,
            url: R.assetsImagesGuidePageGuide1)
      ],
      jumpPage: HomeRoutePath.home);
}

//启动页固定常量
class StartPageConst {
  static const String key = "key_start_page";

  //启动页-图片
  static const int SPLASH_TYPE_IMAGE = 1;

  //启动页-视频
  static const int SPLASH_TYPE_VIDEO = 2;

  //启动页默认显示数据
  static final StartPageModel startPageModel = StartPageModel(
      backgroundPicture: R.assetsImagesStartPageDefault,
      splashType: SPLASH_TYPE_IMAGE,
      splashScreenTime: 3,
      jumpLink: 'null',
      updatedAt: '1989-07-17 15:23:17');
}
