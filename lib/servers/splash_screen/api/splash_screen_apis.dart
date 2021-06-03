import 'package:share_dream/common/dioConfig.dart';
import 'package:share_dream/servers/common/page/api/base_api.dart';
import 'package:share_dream/servers/common/page/api/base_api_server.dart';
import 'package:share_dream/servers/splash_screen/bloc/guide_page_bloc.dart';
import 'package:share_dream/servers/splash_screen/model/splash_screen_model_index.dart';
import 'package:share_dream/util/log_utils.dart';
import 'package:share_dream/util/net/dio_utils.dart';
import 'package:share_dream/util/sp_util.dart';

import '../splash_screen_const.dart';

//闪屏-启动页-引导页 接口
class SplashScreenApis extends BaseApis {
  //闪屏
  static const String SPLASH_SCREEN = 'ad/splash-screen';

  //启动页
  static const String START_PAGE = 'ad/start-page';

  //引导页
  static const String GUIDE_PAGE = 'ad/guide-page';
}

//数据仓库
class SplashScreenRepository extends BaseApiServer {
  ///获取闪屏页面数据
  Future<SplashScreenModel> splashScreen() async {
    SplashScreenModel splashModel;

    DioUtils.instance.requestNetwork(
        RequestMethod.get, SplashScreenApis.SPLASH_SCREEN,
        options: DioConfig().getVersionOptions(), onSuccess: (data) {
      splashModel = SplashScreenModel.fromJson(data);
    });

    return splashModel;
  }

  ///获取启动页页面数据
  Future<StartPageModel> startPage() async {
    StartPageModel startPageModel;

    await DioUtils.instance.requestNetwork(
        RequestMethod.get, SplashScreenApis.START_PAGE,
        options: DioConfig().getVersionOptions(), onSuccess: (data) {
      startPageModel = StartPageModel.fromJson(data);
      return startPageModel;
    });

    return startPageModel;
  }

  ///获取启动页页面数据
  Future<GuidePageModel> guidePage() async {
    GuidePageModel guidePageModel;

    await DioUtils.instance.requestNetwork(
        RequestMethod.get, SplashScreenApis.GUIDE_PAGE,
        options: DioConfig().getVersionOptions(), onSuccess: (data) {
      guidePageModel = GuidePageModel.fromJson(data);
      return guidePageModel;
    });

    return guidePageModel;
  }

}

class GuidePageServer {

  //获取是否已读引导页
  static bool getReadStatus() {
    return SpUtil.getBool(GuidePageConst.key_read_status);
  }

  //更改已读状态
  static changeForReadStatus() {
    SpUtil.putBool(GuidePageConst.key_read_status, true);
  }

  static cacheGuidePage() async {
    GuidePageModel guidePageModel = _getCache();

    await SplashScreenRepository().guidePage().then((value) {
      //判断是否需要更新。
      if (guidePageModel.updatedAt != value.updatedAt) {
        SpUtil.putObject(GuidePageConst.key, value);
      }
    });
  }

  static GuidePageModel _getCache() {
    GuidePageModel guidePageModel = GuidePageConst.guidePageModel;
    dynamic cache = SpUtil.getObject(GuidePageConst.key);

    //判断缓存是否存在数据
    if (cache != null) {
      guidePageModel = GuidePageModel.fromJson(cache);
    }

    return guidePageModel;
  }

  //获取启动页面缓存数据
  static getCacheGuidePage() {
    cacheGuidePage();

    return _getCache();
  }
}

//
class StartPageServer {
  static cacheStartPage() async {
    StartPageModel startPageModel = _getCache();

    SplashScreenRepository().startPage().then((value) {
      //判断是否需要更新。
      if (startPageModel.updatedAt != value.updatedAt) {
        SpUtil.putObject(StartPageConst.key, value);
      }
    });
  }

  //处理获取缓存数据
  static StartPageModel _getCache() {
    StartPageModel startPageModel = StartPageConst.startPageModel;
    dynamic cache = SpUtil.getObject(StartPageConst.key);

    //判断缓存是否存在数据
    if (cache != null) {
      startPageModel = StartPageModel.fromJson(cache);
    }

    return startPageModel;
  }

  //获取启动页面缓存数据
  static getCacheStartPage() {
    cacheStartPage();

    return _getCache();
  }
}
