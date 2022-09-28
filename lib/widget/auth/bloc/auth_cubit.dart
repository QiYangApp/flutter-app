import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:qi_yang/models/response/user_info_entity.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  //修改授权状态
  modifyAuthState(AuthState authState) => emit(authState);
}
