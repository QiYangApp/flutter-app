import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:share_dream/servers/home/page/home_page.dart';
import 'package:share_dream/servers/splash_screen/bloc/start_page_bloc.dart';
import 'package:share_dream/servers/splash_screen/model/start_page_model.dart';
import 'package:share_dream/servers/splash_screen/page/guide_page.dart';
import 'package:share_dream/servers/splash_screen/widget/splash_screen_widget.dart';
import 'package:share_dream/util/log_utils.dart';

class StartPage extends StatefulWidget {
  @override
  _StartPage createState() => _StartPage();
}

class _StartPage extends State<StartPage> {
  @override
  void initState() {
    super.initState();

    triggerStartPage();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StartPageBloc, StartPageState>(
      builder: (BuildContext context, state) {
        if (state is StartPageJumpHomePage) {
          return HomePage();
        }

        if (state is StartPageJumpGuidePage) {
          return GuidePage();
        }

        StartPageModel startPageModel =
            (state as StartPageLoading).startPageModel;

        if (state is StartPageLoading) {
          context.read<StartPageBloc>().add(StartPageEndEvent(startPageModel.splashScreenTime + 1));
        }

        return SplashScreenWidget((BuildContext context) {
          return;
        },
            startPageModel.splashScreenTime,
            Image.asset(
              startPageModel.backgroundPicture,
              fit: BoxFit.fill,
              width: ScreenUtil().screenWidth,
              height: ScreenUtil().screenHeight,
            ));
      },
    );
  }

  //触发首屏图片
  void triggerStartPage() {
    context.read<StartPageBloc>().add(StartPageStartEvent());
  }
}
