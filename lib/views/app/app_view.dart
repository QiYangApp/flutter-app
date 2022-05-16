import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qi_yang/app/bloc/app_state/app_state_bloc.dart';
import 'package:qi_yang/app/bloc/bottom_tab/bottom_tab_bloc.dart';
import 'package:qi_yang/app/bloc/theme/theme_cubit.dart';
import 'package:qi_yang/app/config/app_config.dart';
import 'package:qi_yang/app/language/language_cubit.dart';
import 'package:qi_yang/app/router/router_manage.dart';
import 'package:qi_yang/tools/singleton/log_singleton.dart';
import 'package:qi_yang/views/home/home_view.dart';

import '../../app/net/http_repository_manage.dart';

//app 入口控制
class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          //全局主题
          BlocProvider(create: (BuildContext context) => AppStateBloc()),
          //主题
          BlocProvider(create: (BuildContext context) => ThemeCubit()),
          //国际化
          BlocProvider(create: (BuildContext context) => LanguageCubit()),
          //底部导航
          BlocProvider(create: (BuildContext context) => BottomTabBloc())
        ],
        child: MultiBlocListener(
          listeners: [
            BlocListener<ThemeCubit, ThemeState>(listener: (context, state) {}),
            BlocListener<LanguageCubit, LanguageState>(
                listener: (context, state) {}),
            BlocListener<BottomTabBloc, BottomTabState>(
                listener: (context, state) {}),
            BlocListener<AppStateBloc, AppStateState>(
                listener: (context, state) {}),
          ],
          child: const AppView(),
        ));
  }
}

class AppView extends StatelessWidget {
  const AppView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LogSingleton.d(HttpRepositoryManage.test(), 1111);

    return MaterialApp(
      debugShowCheckedModeBanner: AppConfig.hasProductEnv(),
      theme: context.watch<ThemeCubit>().state.themeData,
      localizationsDelegates:
          context.watch<LanguageCubit>().state.localizationsDelegates,
      // navigatorObservers: [],
      supportedLocales: context.watch<LanguageCubit>().state.supportedLocales,
      // locale: Locale(Constant.default_lang),
      navigatorKey: RouterManage.getNavigatorStateKey(),
      onGenerateRoute: RouterManage.getRoute().generator,
      home: HomeView(),
    );
  }
}
