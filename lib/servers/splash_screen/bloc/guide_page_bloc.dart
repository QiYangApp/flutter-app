import 'dart:async';

import 'package:QiYang/apis/api_servers.dart';
import 'package:QiYang/model/response/guide_page_response_model.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../guide_page_server.dart';

part 'guide_page_event.dart';

part 'guide_page_state.dart';

class GuidePageBloc extends Bloc<GuidePageEvent, GuidePageState> {
  GuidePageBloc() : super(GuidePageInitial());

  @override
  Stream<GuidePageState> mapEventToState(
    GuidePageEvent event,
  ) async* {
    //点击跳转按钮事件
    if (event is GuidePageJumpPageEvent) {
      yield* _mapEventJumpPageEventToState(event);
    } else if (event is GuidePageStartEvent) {
      yield GuidePageLoading(await ApiServers().guidePage());
    }
  }

  //处理点击按钮事件
  Stream<GuidePageState> _mapEventJumpPageEventToState(
      GuidePageJumpPageEvent event) async* {

    //更改阅读状态
    GuidePageServer.changeForReadStatus();

    yield GuidePageConfirmBtn(event.jumpPath);
  }
}
