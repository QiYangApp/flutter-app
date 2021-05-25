part of 'guide_page_bloc.dart';

abstract class GuidePageEvent extends Equatable {
  const GuidePageEvent();

  @override
  List<Object> get props => [];
}


//点击确认按钮事件, 跳转页面
class GuidePageJumpPageEvent extends GuidePageEvent {}

