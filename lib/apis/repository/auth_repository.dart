import 'package:QiYang/apis/apis.dart';
import 'package:QiYang/model/request/passwd_login_request_model.dart';
import 'package:QiYang/model/response/token_response_model.dart';
import 'package:QiYang/util/net/dio_utils.dart';

class AuthRepository {
  //密码登录
  static Future<TokenResponseModel> passwdLogin(PasswdLoginRequestModel model) async {
    return await DioUtils.instance
        .requestNetwork<TokenResponseModel>(RequestMethod.post, Apis.passwordLogin, params: model);
  }
}
