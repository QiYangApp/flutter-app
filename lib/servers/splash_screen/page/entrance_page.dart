import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:share_dream/servers/splash_screen/api/splash_screen_apis.dart';
import 'package:share_dream/servers/splash_screen/bloc/entrance_cubit.dart';
import 'package:share_dream/servers/splash_screen/bloc/guide_page_bloc.dart';
import 'package:share_dream/servers/splash_screen/bloc/start_page_bloc.dart';
import 'package:share_dream/servers/splash_screen/page/start_page.dart';

import 'guide_page.dart';

class EntrancePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EntranceCubit, EntranceState>(
        builder: (BuildContext context, EntranceState state) {
      if (state.readStatus == false) {
        //启动页
        return BlocProvider(
          create: (BuildContext cnotext) =>
              StartPageBloc(StartPageServer.getCacheStartPage()),
          child: StartPage(),
        );
      } else {
        //引导页
        return BlocProvider(
          create: (BuildContext cnotext) =>
              GuidePageBloc(GuidePageServer.getCacheGuidePage()),
          child: GuidePage(),
        );
      }
    });
  }
}
