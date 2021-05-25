part of 'start_page_bloc.dart';

abstract class StartPageEvent extends Equatable {
  const StartPageEvent();

  @override
  List<Object> get props => [];
}

//页面启动事件
class StartPageStartEvent extends StartPageEvent {}

//页面结束事件
class StartPageEndEvent extends StartPageEvent {

  final int a;

  StartPageEndEvent(this.a);

  @override
  List<Object> get props => [a];
}
