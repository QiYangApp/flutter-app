import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:share_dream/servers/common/page/entry_distribution_page.dart';
import 'package:share_dream/servers/splash_screen/bloc/guide_page_bloc.dart';
import 'package:share_dream/servers/splash_screen/widget/guide_page_widget.dart';

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
        return EntryDistributionPage();
      }

      return GuidePageWidget((state as GuidePageInitial).guidePageModel);
    },);
  }

}