import 'package:QiYang/r.dart';
import 'package:QiYang/servers/common/model/tab_model.dart';
import 'package:QiYang/servers/home/router/home_route.dart';
import 'package:flutter/material.dart';

class TabSelectorConst {
  static const key = 'bottomNavigationKey';

  //默认
  static final int currentIndex = 0;

  //导航
  static final TabModel tabs =
      TabModel(updatedAt: "2020-03-12 00:00:00", index: currentIndex, tabs: [
    Tabs(title: '首页', icon: R.assetsImagesNavHome, route: HomeRoutePath.home),
    Tabs(
      title: '项目',
      icon: R.assetsImagesNavProject,
    ),
    Tabs(
      title: '趋势',
      icon: R.assetsImagesNavTrend,
    ),
    Tabs(
      title: '用户',
      icon: R.assetsImagesNavUser,
    ),
  ]);
}

class TabSelectorColorsConst {
  //选中icon默认颜色
  static const SelectIconColor = Colors.red;

  //选中标题默认颜色
  static const SelectTitleColor = Colors.red;


}
