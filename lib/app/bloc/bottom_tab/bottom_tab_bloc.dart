import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'bottom_tab_event.dart';
part 'bottom_tab_state.dart';

class BottomTabBloc extends Bloc<BottomTabEvent, BottomTabState> {
  BottomTabBloc() : super(BottomTabInitial()) {
    on<BottomTabEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
