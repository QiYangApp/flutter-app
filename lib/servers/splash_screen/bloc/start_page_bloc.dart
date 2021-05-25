import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:share_dream/servers/home/router/home_route.dart';
import 'package:share_dream/servers/splash_screen/api/splash_screen_apis.dart';
import 'package:share_dream/servers/splash_screen/model/splash_screen_model_index.dart';
import 'package:share_dream/servers/splash_screen/splash_screen_const.dart';
import 'package:share_dream/util/log_utils.dart';
import 'package:share_dream/util/sp_util.dart';

part 'start_page_event.dart';

part 'start_page_state.dart';

class StartPageBloc extends Bloc<StartPageEvent, StartPageState> {
  StartPageBloc(StartPageModel startPageModel)
      : super(StartPageLoading(startPageModel));

  @override
  Stream<StartPageState> mapEventToState(
    StartPageEvent event,
  ) async* {
    if (event is StartPageStartEvent) {
      yield* _mapToStartPageToState(event);
    } else if (event is StartPageEndEvent) {
      yield* _mapToEndPageToStates(event);
    }
  }

  //预先加载引导页数据
  Stream<StartPageState> _mapToStartPageToState(
      StartPageStartEvent event) async* {
    //判断缓存是否存在数据
    if (SpUtil.getBool(GuidePageConst.key_read_status) == false) {
      //显示新的启动页
      await SplashScreenRepository().guidePage().then((value) {
        SpUtil.putObject(GuidePageConst.key, value);
      });
    }
  }

  //页面结束事件。 切换页面bloc状态
  Stream<StartPageState> _mapToEndPageToStates(StartPageEndEvent event) async* {
    GuidePageModel guidePageModel = GuidePageConst.guidePageModel;

    Map cache = SpUtil.getObject(GuidePageConst.key);
    if (cache != null) {
      guidePageModel = GuidePageModel.fromJson(cache);
    }

    await Future.delayed(Duration(seconds: event.a));

    //判断缓存是否存在数据
    bool readStatus = SpUtil.getBool(GuidePageConst.key_read_status);
    if (readStatus == false) {
      //跳转引导页
      yield StartPageJumpGuidePage(guidePageModel);
    } else {
      //跳转首页
      yield StartPageJumpHomePage(HomeRoutePath.home);
    }
  }
}
