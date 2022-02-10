import 'package:qi_yang/servers/common/bloc/tab/tab_selector_bloc.dart';
import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TabSelectorWidget extends StatelessWidget {
  final int currentIndex;

  final List<CustomNavigationBarItem> items;

  const TabSelectorWidget({Key key, this.items, this.currentIndex}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomNavigationBar(
      elevation: 0.0,
      iconSize: 30.0,
      selectedColor: Colors.amber,
      strokeColor: Colors.transparent,
      unSelectedColor: Colors.black,
      backgroundColor: Colors.white70,

      items: items,
      // unSelectedColor: Color(0xffacacac),
      currentIndex: currentIndex,
      onTap:  (int index) {
        BlocProvider.of<TabSelectorBloc>(context).add(TabSelectorPageTapped(index));
      },
    );
  }
}
