import 'package:QiYang/router/router_path.dart';
import 'package:QiYang/servers/common/widget/progress_view_widget.dart';
import 'package:QiYang/servers/common/widget/image_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:QiYang/servers/splash_screen/bloc/start_page_bloc.dart';
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
              context, RouterPath.entry);
        }
      },
      builder: (BuildContext context, state) {
        //重复加载完成事件
        if (state is StartPageLoading) {
          return SplashScreenWidget((BuildContext context) {
            context
                .read<StartPageBloc>()
                .add(StartPageEndEvent(RouterPath.home));
            return;
          },
              state.startPageModel.splashScreenTime,
              ImageWidget(
                state.startPageModel.backgroundPicture,
                fit: BoxFit.fill,
                width: ScreenUtil().screenWidth,
                height: ScreenUtil().screenHeight,
              ));
        }

        //进度条
        return ProgressViewWidget();
      },
    );
  }
}
