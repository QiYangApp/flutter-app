import 'package:dio/dio.dart';
import 'package:qi_yang/app/config/net_config.dart';
import 'package:qi_yang/app/net/dio/dio_manage.dart';
import 'package:qi_yang/app/net/entity/base_entity.dart';
import 'package:qi_yang/app/net/repository/abstract_http_repository.dart';
import 'package:qi_yang/models/response/test_entity.dart';
import 'package:retrofit/retrofit.dart';
import 'package:json_annotation/json_annotation.dart';


part 'api_client.g.dart';

@RestApi()
//https://segmentfault.com/a/1190000039269761?utm_source=tag-newest
abstract class ApiClient implements AbstractHttpRepository {
  factory ApiClient(Dio dio, {String baseUrl = ''}) {


    return ApiClient(dio, baseUrl: baseUrl);
  }

  @override
  @GET("/test")
  Future<BaseEntity<TestEntity>> test();
}