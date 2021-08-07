part of 'home_list_bloc.dart';

abstract class HomeListEvent extends Equatable {
  const HomeListEvent();

  @override
  List<Object> get props => [];
}

class HomeListLoad extends HomeListEvent {
  final int page;

  final int limit = 10;

  HomeListLoad({this.page = 1});

  @override
  List<Object> get props => [page, limit];
}