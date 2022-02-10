import 'dart:async';

import 'package:qi_yang/apis/api_servers.dart';
import 'package:qi_yang/model/response/bottom_navigation_response_model.dart';
import 'package:qi_yang/servers/common/widget/tab/tab_selector_items_widget.dart';
import 'package:qi_yang/util/log_utils.dart';
import 'package:bloc/bloc.dart';
import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:equatable/equatable.dart';

part "tab_selector_state.dart";

part 'tab_selector_event.dart';

class TabSelectorBloc extends Bloc<TabSelectorEvent, TabSelectorState> {
  TabSelectorBloc() : super(TabSelectorInitial());

  Stream<TabSelectorState> mapEventToState(
    TabSelectorEvent event,
  ) async* {
    Log.v(state, tag: "tab selector");
    //加载数据
    if (event is TabSelectorInitialEvent) {
      BottomNavigationResponseModel model =
          await ApiServers().bottomNavigation();

      yield TabSelectorLoaded(index: model.index, model: model, tabItem: null);
    } else if (event is TabSelectorPageTapped) {
      //切换tab
      yield (state as TabSelectorLoaded).copyWith(index: event.index);
    }
  }
}
