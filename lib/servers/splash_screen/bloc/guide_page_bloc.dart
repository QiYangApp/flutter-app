import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:share_dream/servers/splash_screen/api/splash_screen_apis.dart';
import 'package:share_dream/servers/splash_screen/model/guide_page_model.dart';

part 'guide_page_event.dart';
part 'guide_page_state.dart';

class GuidePageBloc extends Bloc<GuidePageEvent, GuidePageState> {
  GuidePageBloc(GuidePageModel guidePageModel) : super(GuidePageInitial(guidePageModel));

  @override
  Stream<GuidePageState> mapEventToState(
    GuidePageEvent event,
  ) async* {
    //点击跳转按钮事件
    if (event is GuidePageJumpPageEvent) {
      yield* _mapEventJumpPageEventToState(event);
    }
  }

  //处理点击按钮事件
  Stream<GuidePageState> _mapEventJumpPageEventToState(GuidePageJumpPageEvent event) async* {
    //保存已读状态
    GuidePageServer.changeForReadStatus();

    yield GuidePageConfirmBtn(event.jumpPath);

  }
}
