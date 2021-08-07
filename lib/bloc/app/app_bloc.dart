import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'app_event.dart';

part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc(bool guideReadStatus)
      : super(AppRunningStatus(guideReadStatus: guideReadStatus));

  @override
  Stream<AppState> mapEventToState(
    AppEvent event,
  ) async* {
    if (event is AppChangeGuideReadEvent) {
      yield _mapChangeAppGuideReadStatus(event, state);
    }
  }

  AppRunningStatus _mapChangeAppGuideReadStatus(
      AppChangeGuideReadEvent event, AppRunningStatus status) {
    return status.copyWith(guideReadStatus: event.guideReadStatus);
  }
}
