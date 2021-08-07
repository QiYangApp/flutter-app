import 'package:QiYang/apis/apis.dart';
import 'package:QiYang/model/response/bottom_navigation_response_model.dart';
import 'package:QiYang/util/net/dio_utils.dart';

class NavigationRepository {
  //底部导航
  static Future<BottomNavigationResponseModel> bottomNavigation() async {
    return await DioUtils.instance.requestNetwork<BottomNavigationResponseModel>(
        RequestMethod.get, Apis.bottomNavigation);
  }
}
