import 'package:QiYang/servers/home/router/home_route.dart';
import 'package:QiYang/util/image_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:QiYang/servers/common/router/entry_distribution_router.dart';
import 'package:QiYang/servers/splash_screen/bloc/start_page_bloc.dart';
import 'package:QiYang/servers/splash_screen/model/start_page_model.dart';
import 'package:QiYang/servers/splash_screen/widget/splash_screen_widget.dart';
import 'package:QiYang/util/fluro_navigator.dart';

class StartPage extends StatefulWidget {
  @override
  _StartPage createState() => _StartPage();
}

class _StartPage extends State<StartPage> {
  @override
  void initState() {
    super.initState();

    //触发首屏图片
    context.read<StartPageBloc>().add(StartPageStartEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<StartPageBloc, StartPageState>(
      listener: (BuildContext context, state) {
        //跳转路由
        if (state is StartPageJumpHomePage) {
          NavigatorUtils.push(
              context, EntryDistributionRoutePath.entry_distribution);
        }
      },
      builder: (BuildContext context, state) {
        //重复加载完成事件
        if (state is StartPageLoading) {
          StartPageModel startPageModel = state.startPageModel;

          return SplashScreenWidget((BuildContext context) {
            context
                .read<StartPageBloc>()
                .add(StartPageEndEvent(HomeRoutePath.home));
            return;
          },
              startPageModel.splashScreenTime,
              ImageUtil(
                startPageModel.backgroundPicture,
                fit: BoxFit.fill,
                width: ScreenUtil().screenWidth,
                height: ScreenUtil().screenHeight,
              ));
        }

        //进度条
        return SpinKitFadingCircle(
          color: Colors.blue,
          size: ScreenUtil().setWidth(50),
        );
      },
    );
  }
}
