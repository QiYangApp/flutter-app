import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:qi_yang/models/response/user_info_entity.dart';

part 'app_state_event.dart';
part 'app_state_state.dart';

class AppStateBloc extends Bloc<AppStateEvent, AppStateState> {
  AppStateBloc() : super(AppStateInitial()) {
    on<AppStateEvent>((event, emit) {
    });
  }
}
