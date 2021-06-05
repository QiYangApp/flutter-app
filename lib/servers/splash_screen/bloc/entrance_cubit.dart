import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'entrance_state.dart';

class EntranceCubit extends Cubit<EntranceState> {
  EntranceCubit(bool readStatus) : super(EntranceInitial(readStatus));

  //更新阅读引导页状态
  void switchReadStatus(bool readStatus) {
    if (readStatus != state.readStatus) {
      emit(EntranceInitial(readStatus));
    }
  }

}
