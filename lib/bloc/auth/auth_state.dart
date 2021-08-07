part of 'auth_cubit.dart';

abstract class AuthState extends Equatable {
  const AuthState();
}

class AuthInitial extends AuthState {
  @override
  List<Object> get props => [];
}

class AuthSucceeded extends AuthState {
  final UserInfoResponseModel userInfo;

  AuthSucceeded({this.userInfo});

  AuthSucceeded copyWith({
    final UserInfoResponseModel userInfo,
  }) {
    return AuthSucceeded(
      userInfo: userInfo ?? this.userInfo,
    );
  }

  @override
  List<Object> get props => [userInfo];
}
