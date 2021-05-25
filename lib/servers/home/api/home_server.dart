import 'package:share_dream/common/dioConfig.dart';
import 'package:share_dream/servers/home/api/home_apis.dart';
import 'package:share_dream/servers/home/model/splash_screen_model.dart';
import 'package:share_dream/util/net/dio_utils.dart';

class HomeServer {
  Future<SplashScreenModel> splash() async {
    SplashScreenModel splashModel;

    await DioUtils.instance.requestNetwork(
        RequestMethod.get,
        HomeApis.SPLASH,
        options: DioConfig().getVersionOptions(),
        onSuccess: (data) {
          splashModel = SplashScreenModel.fromJson(data);
        }
    );

    return splashModel;
  }
}
