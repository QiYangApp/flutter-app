import 'package:QiYang/apis/apis.dart';
import 'package:QiYang/model/response/user_info_response_model.dart';
import 'package:QiYang/util/net/dio_utils.dart';

class UserRepository {
  //获取用户信息
  Future<UserInfoResponseModel> userInfo() async {
    return await DioUtils.instance.requestNetwork<UserInfoResponseModel>(RequestMethod.get, Apis.user_info);
  }
}