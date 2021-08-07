import 'package:QiYang/generated/json/base/json_convert_content.dart';
import 'package:QiYang/model/response/user_info_response_model.dart';
import 'package:QiYang/servers/user/const/user_cache_key_const.dart';
import 'package:QiYang/util/sp_util.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  //判断是否登录
  bool isLogin() {
    return state is AuthSucceeded;
  }

  //同步授权信息
  void sync() {
    SpUtil.getObj(UserCacheKeyConst.authKey, (json) {
      emit(AuthSucceeded(userInfo: UserInfoResponseModel().fromJson(json)));
    });
  }

  //写入本地缓存
  Future<void> cacheUserInfo(UserInfoResponseModel userInfo) async {
    SpUtil.putObject(UserCacheKeyConst.authKey, userInfo);
  }

  //登录
  void login(UserInfoResponseModel userInfo) {
    cacheUserInfo(userInfo);

    emit(AuthSucceeded(userInfo: userInfo));
  }

  //修改用户信息
  void modifyUserInfo(UserInfoResponseModel userInfo) async {

    if (state is AuthSucceeded) {
      cacheUserInfo(userInfo);
      emit((state as AuthSucceeded).copyWith(userInfo: userInfo));
    }
  }

  //退出登录
  Future<bool> signOut() async {
    emit(AuthInitial());
  }
}
