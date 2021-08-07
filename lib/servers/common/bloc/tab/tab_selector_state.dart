part of 'tab_selector_bloc.dart';

abstract class TabSelectorState extends Equatable {
  const TabSelectorState();

  @override
  List<Object> get props => [];
}

class TabSelectorInitial extends TabSelectorState {}

class TabSelectorLoaded extends TabSelectorState {
  final int index;

  final BottomNavigationResponseModel model;

  TabSelectorLoaded copyWith({
    final int index = 0,
    final BottomNavigationResponseModel model,
    List<CustomNavigationBarItem> tabItem,
  }) {
    return TabSelectorLoaded(
        index: index ?? this.index,
        model: model ?? this.model,
        tabItem: tabItem ?? this.tabItem);
  }

  List<CustomNavigationBarItem> tabItem;

  TabSelectorLoaded({this.index, this.model, this.tabItem}) {
    if (tabItem == null) {
      tabItem = model.tabs.map((e) {
        return TabSelectorItemsWidget(title: e.title, icon: e.icon)
            .getTabItem();
      }).toList();
    }
  }

  @override
  List<Object> get props => [tabItem, model, index];
}
