part of 'tab_selector_bloc.dart';

abstract class TabSelectorEvent extends Equatable {
  const TabSelectorEvent();

  @override
  List<Object> get props => [];
}


class TabSelectorInitialEvent extends TabSelectorEvent {}

//跳转页面
class TabSelectorPageTapped extends TabSelectorEvent {
  final int index;

  TabSelectorPageTapped(this.index);
}