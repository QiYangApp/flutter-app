import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:QiYang/servers/common/router/entry_distribution_router.dart';
import 'package:QiYang/servers/splash_screen/bloc/guide_page_bloc.dart';
import 'package:QiYang/servers/splash_screen/widget/guide_page_widget.dart';
import 'package:QiYang/util/fluro_navigator.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class GuidePage extends StatefulWidget {
  @override
  _GuidePageState createState() => _GuidePageState();
}

class _GuidePageState extends State<GuidePage> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GuidePageBloc, GuidePageState>(
      listener: (BuildContext context, state) {
        //跳转路由
        if (state is GuidePageConfirmBtn) {
          NavigatorUtils.push(
              context, EntryDistributionRoutePath.entry_distribution);
        }
      },
      builder: (BuildContext context, state) {
          //跳转路由
          if (state is GuidePageConfirmBtn) {
            //进度条
            return SpinKitFadingCircle(
              color: Colors.blue,
              size: ScreenUtil().setWidth(50),
            );
          }

          return GuidePageWidget((state as GuidePageInitial).guidePageModel);
        },
    );
  }
}
