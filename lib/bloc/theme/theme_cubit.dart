import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:QiYang/common/theme_config.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeInitial(ThemeConfig.lightTheme, SystemUiOverlayStyle(statusBarColor: Colors.transparent,statusBarIconBrightness: Brightness.dark)));


  /// Toggles the current brightness between light and dark.
  void changeTheme({ThemeData theme, SystemUiOverlayStyle systemUiOverlayStyle}) {

    //使用自定义
    if (theme == null) {
      emit(ThemeStateChange(state.theme, systemUiOverlayStyle));
    }

    emit(ThemeStateChange(theme, systemUiOverlayStyle));

    // //手动切换
    // if (state.theme.brightness == Brightness.light) {
    //   emit(ThemeStateChange(ThemeConfig.lightTheme, systemUiOverlayStyle));
    // } else {
    //   emit(ThemeStateChange(ThemeConfig.darkTheme, systemUiOverlayStyle));
    // }
  }
}
