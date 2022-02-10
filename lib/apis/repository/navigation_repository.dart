import 'package:qi_yang/apis/apis.dart';
import 'package:qi_yang/model/response/bottom_navigation_response_model.dart';
import 'package:qi_yang/util/net/dio_utils.dart';

class NavigationRepository {
  //底部导航
  static Future<BottomNavigationResponseModel> bottomNavigation() async {
    return await DioUtils.instance.requestNetwork<BottomNavigationResponseModel>(
        RequestMethod.get, Apis.bottomNavigation);
  }
}
