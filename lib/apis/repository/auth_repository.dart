import 'package:qi_yang/apis/apis.dart';
import 'package:qi_yang/model/request/passwd_login_request_model.dart';
import 'package:qi_yang/model/response/token_response_model.dart';
import 'package:qi_yang/util/net/dio_utils.dart';

class AuthRepository {
  //密码登录
  static Future<TokenResponseModel> passwdLogin(PasswdLoginRequestModel model) async {
    return await DioUtils.instance
        .requestNetwork<TokenResponseModel>(RequestMethod.post, Apis.passwordLogin, params: model);
  }
}
