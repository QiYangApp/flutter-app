part of 'guide_page_bloc.dart';

abstract class GuidePageState extends Equatable {
  const GuidePageState();

  @override
  List<Object> get props => [];
}

//初始化
class GuidePageInitial extends GuidePageState {

}

class GuidePageLoading extends GuidePageState {
  final GuidePageResponseModel guidePageModel;

  GuidePageLoading(this.guidePageModel);

  @override
  List<Object> get props => [guidePageModel];
}

//点击确认按钮状态
class GuidePageConfirmBtn extends GuidePageState {
  final String jumpPage;

  GuidePageConfirmBtn(this.jumpPage);

  @override
  List<Object> get props => [this.jumpPage];
}