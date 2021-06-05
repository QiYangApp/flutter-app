import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TabSelectorWidget extends StatelessWidget {

  final int currentIndex;

  final List<CustomNavigationBarItem> items;

  final Function(int) onTap;

  const TabSelectorWidget({Key key, this.items, this.currentIndex, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomNavigationBar(
      items: items,
      iconSize: 30.0,
      selectedColor: Color(0xff040307),
      strokeColor: Color(0x30040307),
      unSelectedColor: Color(0xffacacac),
      backgroundColor: Colors.white,
      currentIndex: currentIndex,
      onTap: onTap,
    );
  }
}
