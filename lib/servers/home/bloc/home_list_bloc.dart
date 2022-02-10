import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:qi_yang/apis/api_servers.dart';
import 'package:qi_yang/model/response/article_classify_response_model.dart';

part 'home_list_event.dart';

part 'home_list_state.dart';

class HomeListBloc extends Bloc<HomeListEvent, HomeListState> {
  HomeListBloc() : super(HomeListInitial());

  Stream<HomeListState> mapEventToState(
    HomeListEvent event,
  ) async* {
    if (event is HomeListLoad) {
      yield HomeListLoadSuccess(
          await ApiServers().hotHome(page: event.page, limit: event.limit));
    }
  }
}
