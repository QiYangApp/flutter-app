import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:share_dream/servers/home/page/home_page.dart';
import 'package:share_dream/servers/home/router/home_route.dart';
import 'package:share_dream/servers/splash_screen/bloc/guide_page_bloc.dart';
import 'package:share_dream/servers/splash_screen/model/guide_page_model.dart';
import 'package:share_dream/servers/splash_screen/widget/guide_page_widget.dart';
import 'package:share_dream/util/fluro_navigator.dart';
import 'package:share_dream/util/log_utils.dart';

class GuidePage extends StatefulWidget {
  // final GuidePageModel guidePageModel;
  //
  // GuidePage(this.guidePageModel);

  @override
  _GuidePageState createState() => _GuidePageState();
}

class _GuidePageState extends State<GuidePage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GuidePageBloc, GuidePageState>(builder: (BuildContext context, GuidePageState state) {
      //跳转路由
      if (state is GuidePageConfirmBtn) {
        return HomePage();
      }

      return GuidePageWidget((state as GuidePageInitial).guidePageModel);
    },);
  }

}