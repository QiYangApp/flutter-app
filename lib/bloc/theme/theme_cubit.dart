import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:share_dream/common/theme_config.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeInitial(ThemeConfig.lightTheme));

  /// Toggles the current brightness between light and dark.
  void toggleTheme({ThemeData theme}) {

    //使用自定义
    if (theme != null) {
      emit(ThemeStateChange(theme));
    }

    //手动切换
    if (state.theme.brightness == Brightness.light) {
      emit(ThemeStateChange(ThemeConfig.lightTheme));
    } else {
      emit(ThemeStateChange(ThemeConfig.darkTheme));
    }
  }

}
