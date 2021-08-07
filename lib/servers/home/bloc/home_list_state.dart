part of 'home_list_bloc.dart';

abstract class HomeListState extends Equatable {
  const HomeListState();

  @override
  List<Object> get props => [];
}

class HomeListInitial extends HomeListState {

}

class HomeListLoadSuccess extends HomeListState {
  final ArticleClassifyResponseModel articleClassifyHotModel;

  HomeListLoadSuccess(this.articleClassifyHotModel);

  @override
  List<Object> get props => [articleClassifyHotModel];
}