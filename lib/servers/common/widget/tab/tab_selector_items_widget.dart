import 'package:qi_yang/servers/common/const/tab_selector_const.dart';
import 'package:flutter/material.dart';
import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

class TabSelectorItemsWidget {
  final String title;
  final String icon;

  const TabSelectorItemsWidget({this.title, this.icon});

  CustomNavigationBarItem getTabItem() {
    final Widget iconWidget = SvgPicture.asset(this.icon);
    final Widget textWidget = Text(this.title);

    return CustomNavigationBarItem(
        icon: iconWidget,
        title: textWidget,
        selectedIcon: new SvgPicture.asset(
          this.icon,
          color: TabSelectorColorsConst.SelectIconColor,
        ),
        selectedTitle: new Text(
          title,
          style: TextStyle(color: TabSelectorColorsConst.SelectTitleColor),
        ));
  }
}
