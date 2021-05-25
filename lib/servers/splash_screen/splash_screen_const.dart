import 'package:share_dream/r.dart';
import 'package:share_dream/servers/home/router/home_route.dart';
import 'package:share_dream/servers/splash_screen/model/splash_screen_model_index.dart';

//引导页
class GuidePageConst {
  //数据存储可以
  static const String key = 'key_guide';

  //读取状态
  static const String key_read_status = 'key_guide_read_status';

  static final GuidePageModel guidePageModel = GuidePageModel(
      updatedAt: '1989-07-17 15:23:17',
      images: [
        R.assetsImagesGuidePageGuide1,
        R.assetsImagesGuidePageGuide2,
        R.assetsImagesGuidePageGuide3,
      ],
      jumpPage: HomeRoutePath.home
  );
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
