import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'entrance_state.dart';

class EntranceCubit extends Cubit<EntranceState> {
  EntranceCubit(bool readStatus) : super(EntranceInitial(readStatus));
}
