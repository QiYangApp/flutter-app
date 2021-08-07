part of 'start_page_bloc.dart';

abstract class StartPageState extends Equatable {
  const StartPageState();

  @override
  List<Object> get props => [];
}

class StartPageInitial extends StartPageState {

}

class StartPageLoading extends StartPageState {
  final StartPageResponseModel startPageModel;

  StartPageLoading(this.startPageModel);

  @override
  List<Object> get props => [startPageModel];
}

//跳转首页状态
class StartPageJumpHomePage extends StartPageState {

  final String jumpPage;

  StartPageJumpHomePage(this.jumpPage);

  @override
  List<Object> get props => [jumpPage];
}
