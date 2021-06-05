import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:share_dream/bloc/app_bloc.dart';
import 'package:share_dream/bloc/theme/theme_cubit.dart';
import 'package:share_dream/common/common.dart';
import 'package:share_dream/router/router.dart';
import 'package:share_dream/servers/common/api/tab_apis.dart';
import 'package:share_dream/servers/common/bloc/tab/tab_selector_bloc.dart';
import 'package:share_dream/servers/common/model/tab_model.dart';
import 'package:share_dream/servers/splash_screen/api/splash_screen_apis.dart';
import 'package:share_dream/servers/splash_screen/bloc/entrance_cubit.dart';
import 'package:share_dream/servers/splash_screen/page/entrance_page.dart';

import 'common/global.dart';
import 'generated/l10n.dart';

Future<void> main() async {
  Global.init(() {
    //设置像素自适应
    runApp(ScreenUtilInit(designSize: Size(375, 850), builder: () => App()));
  });
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          //全局状态或者事件
          BlocProvider<AppBloc>(
            create: (BuildContext context) => AppBloc(),
          ),
          //全局主题
          BlocProvider<ThemeCubit>(
            create: (BuildContext context) => ThemeCubit(),
          ),
          //tab 导航
          BlocProvider<TabSelectorBloc>(create: (BuildContext context) {
            return TabSelectorBloc(TabServer.getCacheAllTabs());
          }),
        ],
        child: BlocBuilder<AppBloc, AppState>(builder: (context, state) {
          return AppView();
        }));
  }
}

class AppView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(builder: (context, state) {
      return MaterialApp(
          debugShowCheckedModeBanner: AppConfig.hasProductEnv(),
          theme: state.theme,
          localizationsDelegates: [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
          ],
          supportedLocales: S.delegate.supportedLocales,
          // locale: Locale(Constant.default_lang),
          navigatorKey: BaseRouter.navigatorKey,
          onGenerateRoute: BaseRouter.route.generator,
          home: BlocProvider(
              create: (BuildContext context) =>
                  EntranceCubit(GuidePageServer.getReadStatus()),
              child: EntrancePage()));
    });
  }
}
