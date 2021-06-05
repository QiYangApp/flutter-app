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
      context
          .read<EntranceCubit>()
          .switchReadStatus(GuidePageServer.getReadStatus());

      if (state.readStatus) {
        //启动页
        return BlocProvider(
          create: (BuildContext context) =>
              StartPageBloc(StartPageServer.getCacheStartPage()),
          child: StartPage(),
        );
      } else {
        //引导页
        return BlocProvider(
          create: (BuildContext context) =>
              GuidePageBloc(GuidePageServer.getCacheGuidePage()),
          child: GuidePage(),
        );
      }
    });
  }
}
