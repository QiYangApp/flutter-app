import 'package:qi_yang/apis/apis.dart';
import 'package:qi_yang/model/response/user_info_response_model.dart';
import 'package:qi_yang/util/net/dio_utils.dart';

class UserRepository {
  //获取用户信息
  Future<UserInfoResponseModel> userInfo() async {
    return await DioUtils.instance.requestNetwork<UserInfoResponseModel>(RequestMethod.get, Apis.user_info);
  }
}