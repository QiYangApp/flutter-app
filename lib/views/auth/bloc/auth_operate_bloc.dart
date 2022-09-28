import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'auth_operate_event.dart';
part 'auth_operate_state.dart';

class AuthOperateBloc extends Bloc<AuthOperateEvent, AuthOperateState> {
  AuthOperateBloc() : super(AuthOperateInitial()) {
    on<AuthOperateEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
