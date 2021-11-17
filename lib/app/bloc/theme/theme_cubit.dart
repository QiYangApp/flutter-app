import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

part 'theme_state.dart';

//https://blog.csdn.net/c10wtiybq1ye3/article/details/109251995
class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeInitial().init());

  void changeTheme(ThemeData themeData) =>
      emit((state as ThemeInitial).clone()..themeData = themeData);

  void changeSystemUiOverlayStyle(SystemUiOverlayStyle systemUiOverlayStyle) =>
      emit((state as ThemeInitial).clone()
        ..systemUiOverlayStyle = systemUiOverlayStyle);
}
