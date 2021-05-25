import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:share_dream/bloc/app_bloc.dart';
import 'package:share_dream/bloc/theme/theme_cubit.dart';
import 'package:share_dream/common/common.dart';
import 'package:share_dream/router/router.dart';
import 'package:share_dream/servers/splash_screen/api/splash_screen_apis.dart';
import 'package:share_dream/servers/splash_screen/bloc/guide_page_bloc.dart';

import 'common/global.dart';
import 'generated/l10n.dart';

void main() {
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
          //全局状态或者事件1
          BlocProvider<AppBloc>(
            create: (BuildContext context) {
              return AppBloc(GuidePageServer.getReadStatus());
            },
          ),
          //全局主题
          BlocProvider<ThemeCubit>(
            create: (BuildContext context) => ThemeCubit(),
          ),
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
        home: Scaffold(
          key: Constant.globalKey,
          body: SafeArea(
            child: MultiBlocProvider(
              providers: [
                //引导页
                BlocProvider.value(
                    value: GuidePageBloc(GuidePageServer.getReadStatus()))
              ],
              child: BlocBuilder<GuidePageBloc, GuidePageState>(
                builder: (BuildContext context, GuidePageState state) {
                  // if () {
                  //   return GuidePage(GuidePageServer.getCacheGuidePage())
                  // }

                  return Text("Hello World");
                },
              ),
            ),
          ),
        ),
      );
    });
  }
}
