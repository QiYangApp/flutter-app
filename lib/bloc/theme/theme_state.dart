part of 'theme_cubit.dart';

///默认主题正式状态
abstract class ThemeState extends Equatable {
  @override
  List<Object> get props => [theme];

  final ThemeData theme;

  const ThemeState(this.theme);
}

//主题初始化
class ThemeInitial extends ThemeState {
  ThemeInitial(ThemeData theme) : super(theme);
}

//主题状态改变
class ThemeStateChange extends ThemeState {
  ThemeStateChange(ThemeData theme) : super(theme);
}