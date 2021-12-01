import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'app_state_event.dart';
part 'app_state_state.dart';

class AppStateBloc extends Bloc<AppStateEvent, AppStateState> {
  AppStateBloc() : super(AppStateInitial()) {
    on<AppStateEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
