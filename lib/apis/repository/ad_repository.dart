import 'package:qi_yang/apis/apis.dart';
import 'package:qi_yang/model/request/banner_request_model.dart';
import 'package:qi_yang/model/response/banner_response_model.dart';
import 'package:qi_yang/model/response/guide_page_response_model.dart';
import 'package:qi_yang/model/response/start_page_response_model.dart';
import 'package:qi_yang/util/net/dio_utils.dart';

class AdRepository {
  //查询启动页数据
  static Future<StartPageResponseModel> startPage() async {
    return await DioUtils.instance.requestNetwork<StartPageResponseModel>(
      RequestMethod.get,
      Apis.START_PAGE,
    );
  }

  //查询引导页数据
  static Future<GuidePageResponseModel> guidePage() async {
    return await DioUtils.instance.requestNetwork<GuidePageResponseModel>(
      RequestMethod.get,
      Apis.GUIDE_PAGE,
    );
  }

  //banner
  static Future<BannerResponseModel> banner(BannerRequestModel model) async {
    return await DioUtils.instance.requestNetwork<BannerResponseModel>(
        RequestMethod.get, Apis.Banner,
        queryParameters: model.toJson());
  }
}
