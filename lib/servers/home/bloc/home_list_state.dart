part of 'home_list_bloc.dart';

abstract class HomeListState extends Equatable {
  const HomeListState();
}

class HomeListInitial extends HomeListState {
  @override
  List<Object> get props => [];
}
