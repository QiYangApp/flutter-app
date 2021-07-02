import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:QiYang/servers/splash_screen/api/splash_screen_apis.dart';
import 'package:QiYang/servers/splash_screen/model/splash_screen_model_index.dart';

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
      await StartPageServer.cacheStartPage();
      yield StartPageLoading(StartPageServer.getCacheStartPage());
    }

    //跳转页面
    if (event is StartPageEndEvent) {
      yield StartPageJumpHomePage(event.jumpPagePath);
    }
  }
}
