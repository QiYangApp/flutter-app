import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qi_yang/util/log_utils.dart';

class AppBlocObserver extends BlocObserver {

  static const String tag = 'App-Bloc-Observer';

  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    Log.v('onCreate -- ${bloc.runtimeType}', tag: tag);
  }

  @override
  void onEvent(Bloc bloc, Object event) {
    super.onEvent(bloc, event);
    Log.v('onEvent -- ${bloc.runtimeType}, $event', tag: tag);
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    Log.v('onChange -- ${bloc.runtimeType}, $change', tag: tag);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    Log.v('onTransition -- ${bloc.runtimeType}, $transition', tag: tag);
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    Log.v('onError -- ${bloc.runtimeType}, $error', tag: tag);
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    Log.v('onClose -- ${bloc.runtimeType}', tag: tag);
  }
}