import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'home_list_event.dart';
part 'home_list_state.dart';

class HomeListBloc extends Bloc<HomeListEvent, HomeListState> {
  HomeListBloc() : super(HomeListInitial());

  @override
  Stream<HomeListState> mapEventToState(
    HomeListEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
