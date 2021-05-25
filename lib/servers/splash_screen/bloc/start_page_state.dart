part of 'start_page_bloc.dart';

abstract class StartPageState extends Equatable {
  const StartPageState();

  @override
  List<Object> get props => [];
}

class StartPageLoading extends StartPageState {
  final StartPageModel startPageModel;

  StartPageLoading(this.startPageModel);

  @override
  List<Object> get props => [startPageModel];
}

//跳转引导页状态
class StartPageJumpGuidePage extends StartPageState {
  final GuidePageModel guidePageModel;

  StartPageJumpGuidePage(this.guidePageModel);

  @override
  List<Object> get props => [guidePageModel];
}

//跳转首页状态
class StartPageJumpHomePage extends StartPageState {

  final String jumpPage;

  StartPageJumpHomePage(this.jumpPage);

  @override
  List<Object> get props => [jumpPage];
}
