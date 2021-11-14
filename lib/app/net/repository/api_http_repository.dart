import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:qi_yang/app/config/net_config.dart';
import 'package:qi_yang/app/net/dio/dio_manage.dart';
import 'package:qi_yang/app/net/entity/base_entity.dart';
import 'package:qi_yang/models/response/test_entity.dart';
import 'abstract_http_repository.dart';

import 'package:qi_yang/app/net/repository/abstract_http_repository.dart';
import 'package:qi_yang/models/response/test_entity.dart';
import 'package:retrofit/retrofit.dart';
import 'package:json_annotation/json_annotation.dart';

part 'api_http_repository.g.dart';

//网络请求
//https://segmentfault.com/a/1190000039269761?utm_source=tag-newest
@RestApi()
abstract class ApiHttpRepository extends AbstractHttpRepository {
  static final String baseUrl = NetConfig.getAppUrlSuffix();

  static late Dio dio;

  factory ApiHttpRepository() {
    return _ApiHttpRepository(DioManage.getDio(), baseUrl: baseUrl);
  }

  static Dio getDio() {
    return dio;
  }

  @override
  @GET("/test")
  Future<BaseEntity<TestEntity>> test();
}
