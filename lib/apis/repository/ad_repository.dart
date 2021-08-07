import 'package:QiYang/apis/apis.dart';
import 'package:QiYang/model/request/banner_request_model.dart';
import 'package:QiYang/model/response/banner_response_model.dart';
import 'package:QiYang/model/response/guide_page_response_model.dart';
import 'package:QiYang/model/response/start_page_response_model.dart';
import 'package:QiYang/util/net/dio_utils.dart';

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
