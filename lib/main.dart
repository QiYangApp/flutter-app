import 'dart:io';

import 'package:qi_yang/bloc/app/app_bloc.dart';
import 'package:qi_yang/bloc/auth/auth_cubit.dart';
import 'package:qi_yang/servers/splash_screen/bloc/guide_page_bloc.dart';
import 'package:qi_yang/servers/splash_screen/bloc/start_page_bloc.dart';
import 'package:qi_yang/servers/splash_screen/guide_page_server.dart';
import 'package:qi_yang/servers/splash_screen/page/guide_page.dart';
import 'package:qi_yang/servers/splash_screen/page/start_page.dart';
import 'package:qi_yang/util/analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qi_yang/bloc/theme/theme_cubit.dart';
import 'package:qi_yang/common/common.dart';
import 'package:qi_yang/router/router.dart';
import 'package:qi_yang/servers/common/bloc/tab/tab_selector_bloc.dart';

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
    return MultiBlocProvider(providers: [
      //全局状态或者事件
      BlocProvider<AppBloc>(
        create: (BuildContext context) =>
            AppBloc(GuidePageServer.getReadStatus()),
      ),
      //全局主题
      BlocProvider<ThemeCubit>(
        create: (BuildContext context) => ThemeCubit(),
      ),
      //tab 导航
      BlocProvider<TabSelectorBloc>(
          create: (BuildContext context) => TabSelectorBloc()),
      //授权
      BlocProvider<AuthCubit>(create: (BuildContext context) => AuthCubit())
    ], child: AppView());
  }
}

class AppView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
        buildWhen: (previous, current) =>
            previous.systemUiOverlayStyle != current.systemUiOverlayStyle,
        builder: (context, state) {
          // 以下两行 设置android状态栏为透明的沉浸。写在组件渲染之后，是为了在渲染后进行set赋值，覆盖状态栏，写在渲染之前MaterialApp组件会覆盖掉这个值。
          if (Platform.isAndroid) {
            SystemChrome.setSystemUIOverlayStyle(state.systemUiOverlayStyle);
          }

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
            navigatorObservers: [observer],
            supportedLocales: S.delegate.supportedLocales,
            // locale: Locale(Constant.default_lang),
            navigatorKey: BaseRouter.navigatorKey,
            onGenerateRoute: BaseRouter.route.generator,
            home: BlocBuilder<AppBloc, AppState>(builder: (context, state) {
              //更新底部导航
              BlocProvider.of<TabSelectorBloc>(context)
                  .add(TabSelectorInitialEvent());

              //同步登录状态
              BlocProvider.of<AuthCubit>(context).sync();

              //已经进入过引导页
              if ((state as AppRunningStatus).guideReadStatus) {
                //启动页
                return BlocProvider(
                  create: (BuildContext context) => StartPageBloc(),
                  child: StartPage(),
                );
              }

              //引导页
              return BlocProvider(
                create: (BuildContext context) => GuidePageBloc(),
                child: GuidePage(),
              );
            }),
          );
        });
  }
}
