import 'package:dio/dio.dart';
import 'package:qi_yang/app/config/net_config.dart';
import 'package:qi_yang/app/net/dio/dio_manage.dart';
import 'package:qi_yang/app/net/repository/abstract_http_repository.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';

part 'api_client.g.dart';

@RestApi()
//https://segmentfault.com/a/1190000039269761?utm_source=tag-newest
abstract class ApiClient implements AbstractHttpRepository {
  factory ApiClient(Dio dio, {String baseUrl = ''}) {
    dio = DioManage.instance.dio;
    baseUrl = NetConfig.getAppUrlSuffix();

    return ApiClient(dio, baseUrl: baseUrl);
  }
}