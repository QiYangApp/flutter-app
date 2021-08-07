import 'package:QiYang/apis/apis.dart';
import 'package:QiYang/model/request/pagination_request_model.dart';
import 'package:QiYang/model/response/article_classify_response_model.dart';
import 'package:QiYang/util/net/dio_utils.dart';
import 'package:dio_http_cache/dio_http_cache.dart';

//文章请求仓库
class ArticleClassifyRepository {
  //热点文章-首页
  static Future<ArticleClassifyResponseModel> hotHome(
      PaginationRequestModel page) async {
    return await DioUtils.instance.requestNetwork<ArticleClassifyResponseModel>(
        RequestMethod.get, Apis.hot_home,
        queryParameters: page.toJson(),
        options: buildCacheOptions(Duration(days: 1), subKey: page.toJson().toString()));
  }
}
