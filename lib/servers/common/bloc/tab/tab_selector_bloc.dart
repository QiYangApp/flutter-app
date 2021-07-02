import 'dart:async';

import 'package:QiYang/servers/common/widget/tab/tab_selector_items_widget.dart';
import 'package:bloc/bloc.dart';
import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:equatable/equatable.dart';
import 'package:QiYang/servers/common/model/tab_model.dart';
import 'package:flutter/cupertino.dart';

part 'tab_selector_event.dart';

class TabSelectorBloc extends Bloc<TabSelectorEvent, int> {
  final TabModel tabModel;

  final pageController = PageController();

  List<CustomNavigationBarItem> tabItems;

  TabSelectorBloc(this.tabModel) : super(0);

  @override
  Stream<int> mapEventToState(
    TabSelectorEvent event,
  ) async* {
    if (event is TabSelectorPageTapped) {
      yield event.index;
    }
  }

  //更新tab
  updateTabItems() {
    tabItems = tabModel.tabs.map((e) {
      return TabSelectorItemsWidget(title: e.title, icon: e.icon).getTabItem();
    }).toList();
  }
}
