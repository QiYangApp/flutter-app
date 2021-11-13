import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:qi_yang/app/config/net_config.dart';
import 'package:qi_yang/app/net/dio/dio_manage.dart';
import 'package:qi_yang/app/net/entity/base_entity.dart';
import 'package:qi_yang/app/net/retrofit/api_client.dart';
import 'package:qi_yang/models/response/test_entity.dart';
import 'abstract_http_repository.dart';


//网络请求
class ApiHttpRepository extends AbstractHttpRepository {

  static final ApiHttpRepository _singleton = ApiHttpRepository._();

  static ApiHttpRepository get instance => ApiHttpRepository();

  factory ApiHttpRepository() => _singleton;

  static late ApiClient _apiClient;

  final Dio _dio = DioManage.instance.dio;

  Dio get dio => _dio;

  final String _baseUrl = NetConfig.getAppUrlSuffix();

  ApiHttpRepository._() {
    _apiClient = ApiClient(_dio, baseUrl: _baseUrl);
  }

  @override
  Future<BaseEntity<TestEntity>> test() {
    return _apiClient.test();
  }

}