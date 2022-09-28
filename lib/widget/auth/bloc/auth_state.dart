part of 'auth_cubit.dart';

abstract class AuthState extends Equatable {
  const AuthState();
}

class AuthInitial extends AuthState {
  @override
  List<Object> get props => [];
}

//授权中
class AuthLoading extends AuthInitial {}

//授权失败
class AuthFailure extends AuthInitial {
  late String message;

  AuthFailure(this.message);

  @override
  List<Object> get props => [message];
}

class AuthSuccess extends AuthInitial {
  late UserInfoEntity userInfoEntity;

  late String token;
}