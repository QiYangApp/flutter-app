import 'package:QiYang/apis/apis.dart';
import 'package:QiYang/model/request/pagination_request_model.dart';
import 'package:QiYang/model/response/article_classify_response_model.dart';
import 'package:QiYang/model/response/article_detail_response_model.dart';
import 'package:QiYang/util/log_utils.dart';
import 'package:QiYang/util/net/dio_utils.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:sprintf/sprintf.dart';

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

  //获取文章详情
  static Future<ArticleDetailResponseModel> detail(String id) async {
    Log.v(id);
    return await DioUtils.instance.requestNetwork<ArticleDetailResponseModel>(
    RequestMethod.get, sprintf(Apis.article_detail, [id]));
  }
}
