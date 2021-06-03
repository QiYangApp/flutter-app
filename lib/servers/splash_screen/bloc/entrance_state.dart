part of 'entrance_cubit.dart';

abstract class EntranceState extends Equatable {
  //引导页阅读状态
  final bool readStatus;

  EntranceState(this.readStatus);

  @override
  List<Object> get props => [readStatus];
}

class EntranceInitial extends EntranceState {
  EntranceInitial(bool readStatus) : super(readStatus);
}
