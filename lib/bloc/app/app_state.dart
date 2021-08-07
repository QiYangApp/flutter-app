part of 'app_bloc.dart';

abstract class AppState extends Equatable {
  const AppState();
}

class AppInitial extends AppState {
  @override
  List<Object> get props => [];
}


class AppRunningStatus extends AppState {

  final bool guideReadStatus;

  AppRunningStatus({this.guideReadStatus = false});

  AppRunningStatus copyWith({
    bool guideReadStatus,
  }) {
    return AppRunningStatus(
      guideReadStatus: guideReadStatus ?? this.guideReadStatus,
    );
  }

  @override
  List<Object> get props => [guideReadStatus];
}