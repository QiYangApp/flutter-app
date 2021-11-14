import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qi_yang/tools/singleton/log_singleton.dart';

class AppBlocObserver extends BlocObserver {

  static const String tag = 'App-Bloc-Observer';

  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    LogSingleton.v('onCreate -- ${bloc.runtimeType}');
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    LogSingleton.v('onEvent -- ${bloc.runtimeType}, $event');
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    LogSingleton.v('onChange -- ${bloc.runtimeType}, $change');
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    LogSingleton.v('onTransition -- ${bloc.runtimeType}, $transition');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    LogSingleton.v('onError -- ${bloc.runtimeType}, $error');
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    LogSingleton.v('onClose -- ${bloc.runtimeType}');
  }
}