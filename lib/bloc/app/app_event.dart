part of 'app_bloc.dart';

abstract class AppEvent extends Equatable {
  const AppEvent();
}

//修改app 状态
class AppChangeGuideReadEvent extends AppEvent {

  final bool guideReadStatus;

  AppChangeGuideReadEvent(this.guideReadStatus);

  @override
  List<Object> get props => [guideReadStatus];
}