import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:qi_yang/apis/api_servers.dart';
import 'package:qi_yang/model/response/start_page_response_model.dart';

part 'start_page_event.dart';

part 'start_page_state.dart';

class StartPageBloc extends Bloc<StartPageEvent, StartPageState> {
  StartPageBloc() : super(StartPageInitial());

  @override
  Stream<StartPageState> mapEventToState(
    StartPageEvent event,
  ) async* {
    //数据初始化
    if (state is StartPageInitial) {
      yield StartPageLoading(await ApiServers().startPage());
    }

    //跳转页面
    if (event is StartPageEndEvent) {
      yield StartPageJumpHomePage(event.jumpPagePath);
    }
  }
}
