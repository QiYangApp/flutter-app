import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qi_yang/apis/api_servers.dart';
import 'package:qi_yang/common/dioConfig.dart';
import 'package:qi_yang/model/response/token_response_model.dart';
import 'package:qi_yang/model/response/user_info_response_model.dart';
import 'package:qi_yang/util/sp_util.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginLoadingState());

  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    if (event is LoginUsernameChanged) {
      yield _mapUsernameChangedToState(event, state);
    } else if (event is LoginPasswordChanged) {
      yield _mapPasswordChangedToState(event, state);
    } else if (event is LoginSubmitted) {
      yield* _mapLoginSubmittedToState(event, state);
    }
  }

  //填写用户名称
  LoginLoadingState _mapUsernameChangedToState(
      LoginUsernameChanged event, LoginLoadingState state) {
    return state.copyWith(
      nickname: event.username,
    );
  }

  //填写密码
  LoginLoadingState _mapPasswordChangedToState(
      LoginPasswordChanged event, LoginLoadingState state) {
    return state.copyWith(password: event.password, nickname: state.nickname);
  }

  //提交数据
  Stream<LoginState> _mapLoginSubmittedToState(
      LoginSubmitted event, LoginLoadingState state) async* {
    try {
      //登录
      //缓存token
      TokenResponseModel tokenModel =
          await ApiServers().passwdLogin(state.nickname, state.password);
      UserInfoResponseModel userInfoModel = await ApiServers().userInfo();

      SpUtil.putObject(Token.accessToken, tokenModel.token);

      yield LoginSuccess(tokenModel, userInfoModel);
    } on Exception catch (e) {
      yield LoginLoadingFailure();
    }
  }
}
