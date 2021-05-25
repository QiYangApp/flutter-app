part of 'guide_page_bloc.dart';

abstract class GuidePageState extends Equatable {
  const GuidePageState();

  @override
  List<Object> get props => [];
}

//阅读状态枚举
enum ReadingStatus {
  haveRead,  //已阅读状态
  unRead //未阅读状态
}

extension ReadingStatusExtension on ReadingStatus {
  get values => [true, false][index];
}

//初始化
class GuidePageInitial extends GuidePageState {
  //是否阅读过引导页
  final bool readingStatus;

  GuidePageInitial(this.readingStatus);

  @override
  List<Object> get props => [readingStatus];
}

//点击确认按钮状态
class GuidePageConfirmBtn extends GuidePageState {
  final String jumpPage;

  GuidePageConfirmBtn(this.jumpPage);

  @override
  List<Object> get props => [this.jumpPage];
}