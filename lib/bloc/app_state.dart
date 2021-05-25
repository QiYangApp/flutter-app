part of 'app_bloc.dart';

abstract class AppState extends Equatable {
  const AppState();
}

class AppInitial extends AppState {

  //是否有读取引导页
  bool isReadGuidePage = false;

  AppInitial(this.isReadGuidePage);

  @override
  List<Object> get props => [isReadGuidePage];
}
