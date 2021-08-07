part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {}

class LoginLoadingState extends LoginState {
  final String nickname;

  final String password;

  final bool state;

  LoginLoadingState({this.nickname = '', this.password = '', this.state = false});

  LoginState copyWith({
    bool status,
    String nickname,
    String password,
  }) {
    return LoginLoadingState(
      state: state ?? this.state,
      nickname: nickname ?? this.nickname,
      password: password ?? this.password,
    );
  }

  @override
  List<Object> get props => [nickname, password, state];
}

//登录成功
class LoginSuccess extends LoginState {
  final TokenResponseModel tokenModel;
  final UserInfoResponseModel userModel;

  LoginSuccess(this.tokenModel, this.userModel);
}

//登录失败
class LoginLoadingFailure extends LoginState {}
