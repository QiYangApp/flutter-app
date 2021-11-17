part of 'theme_cubit.dart';

abstract class ThemeState extends Equatable {
  late ThemeData themeData;

  late SystemUiOverlayStyle systemUiOverlayStyle;

  @override
  List<Object> get props => [themeData, systemUiOverlayStyle];
}

class ThemeInitial extends ThemeState {
  ThemeInitial();

  ThemeState init() {
    return ThemeInitial()
      ..themeData = ThemeData.light()
      ..systemUiOverlayStyle = const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark);
  }

  ThemeState clone() {
    return ThemeInitial()
      ..themeData = themeData
      ..systemUiOverlayStyle = systemUiOverlayStyle;
  }
}
