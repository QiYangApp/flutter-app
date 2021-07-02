import 'package:QiYang/common/dioConfig.dart';
import 'package:QiYang/servers/common/api/base_api.dart';
import 'package:QiYang/servers/common/api/base_api_server.dart';
import 'package:QiYang/servers/common/const/tab_selector_const.dart';
import 'package:QiYang/servers/common/model/tab_model.dart';
import 'package:QiYang/util/net/dio_utils.dart';
import 'package:QiYang/util/sp_util.dart';

//导航
class TabApis extends BaseApis {
  //底部导航
  static const String bottomNavigation = 'navigation/bottom-navigation';
}

class TabRepository extends BaseApiRepository {
  //底部导航
  static Future<TabModel> bottomNavigation() async {
    TabModel tabModel = TabSelectorConst.tabs;

    await DioUtils.instance.requestNetwork(
        RequestMethod.get, TabApis.bottomNavigation,
        options: DioConfig().getVersionOptions(),
        onSuccess: (data) => tabModel = TabModel.fromJson(data));

    return tabModel;
  }
}

class TabServer extends BaseServer {
  static getCacheBottomNavigation() {
    return _cacheTab();
  }

  //缓存底部导航数据
  static _cacheTab() {
    TabModel tabModel = _getCacheBottomNavigation();

    TabRepository.bottomNavigation().then((value) {
      if (tabModel.updatedAt != value.updatedAt) {
        SpUtil.putObject(TabSelectorConst.key, value);
      }
    });

    return tabModel;
  }

  //获取底部缓存数据
  static TabModel _getCacheBottomNavigation() {
    TabModel tabModel = TabSelectorConst.tabs;
    dynamic cache = SpUtil.getObject(TabSelectorConst.key);

    //判断缓存是否存在数据
    if (cache != null) {
      tabModel = TabModel.fromJson(cache);
    }

    return tabModel;
  }
}
