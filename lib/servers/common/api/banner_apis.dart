import 'package:QiYang/servers/common/api/base_api.dart';
import 'package:QiYang/servers/common/api/base_api_server.dart';
import 'package:QiYang/servers/common/const/banner_const.dart';
import 'package:QiYang/servers/common/model/banner_model.dart';
import 'package:QiYang/util/net/dio_utils.dart';
import 'package:QiYang/util/sp_util.dart';

class BannerApis extends BaseApis {
  static const Banner = '/ad/banner';
}

// banner 类型
enum BannerClassify { home }

extension BannerClassifyextension on BannerClassify {
  String get desc {
    switch (this) {
      case BannerClassify.home:
        return 'home';
      default:
        return null;
    }
  }
}

class BannerRepository extends BaseApiRepository {
  static Future<BannerModel> banner(BannerRequestModel model) async {
    BannerModel bannerModel;

    await DioUtils.instance.requestNetwork(RequestMethod.get, BannerApis.Banner,
        queryParameters: model.toJson(),
        onSuccess: (data) => bannerModel = BannerModel.fromJson(data));

    return bannerModel;
  }
}

//对外服务
class BannerServer extends BaseServer {
  static Future<BannerModel> cacheBanner(BannerClassify classify) async {
    BannerModel bannerModel = _getCacheBanner(classify);
    BannerRequestModel requestModel =
        BannerRequestModel(classify: classify.desc);

    await BannerRepository.banner(requestModel).then((v) => bannerModel = v);

    //缓存数据
    if (_getCacheBanner(classify).updatedAt != bannerModel.updatedAt) {
      SpUtil.putObject(BannerConst.getKey(classify.desc), bannerModel);
    }

    return bannerModel;
  }

  //获取缓存
  static BannerModel _getCacheBanner(BannerClassify classify) {
    return SpUtil.getObj(
        BannerConst.getKey(classify.desc), (v) => BannerModel.fromJson(v));
  }
}
