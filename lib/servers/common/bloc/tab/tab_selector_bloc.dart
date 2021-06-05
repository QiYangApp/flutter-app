import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:share_dream/servers/common/model/tab_model.dart';

part 'tab_selector_event.dart';

class TabSelectorBloc extends Bloc<TabSelectorEvent, int> {
  final TabModel tabModel;

  TabSelectorBloc(this.tabModel) : super(0);

  @override
  Stream<int> mapEventToState(
    TabSelectorEvent event,
  ) async* {
    if (event is TabSelectorPageTapped) {
      yield event.index;
    }
  }
}
