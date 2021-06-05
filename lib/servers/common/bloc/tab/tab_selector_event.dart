part of 'tab_selector_bloc.dart';

abstract class TabSelectorEvent extends Equatable {
  const TabSelectorEvent();

  @override
  List<Object> get props => [];
}

class TabSelectorPageTapped extends TabSelectorEvent {
  final int index;

  TabSelectorPageTapped(this.index);
}