import 'dart:async';

import 'package:QiYang/apis/api_servers.dart';
import 'package:QiYang/model/response/article_classify_response_model.dart';
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
    if (event is HomeListLoad) {
      yield HomeListLoadSuccess(
          await ApiServers().hotHome(page: event.page, limit: event.limit));
    }
  }
}
