import 'package:dio/dio.dart';
import 'package:qi_yang/app/config/net_config.dart';
import 'package:qi_yang/app/net/entity/base_entity.dart';
import 'package:qi_yang/app/net/repository/abstract_http_repository.dart';
import 'package:qi_yang/app/net/repository/api_http_repository.dart';
import 'package:qi_yang/app/net/repository/mock_http_repository.dart';
import 'package:qi_yang/models/response/test_entity.dart';

class HttpRepositoryManage {

  HttpRepositoryManage._internal();

  static final HttpRepositoryManage _instance = HttpRepositoryManage._internal();

  late AbstractHttpRepository _repository;

  static init() async {
    if (NetConfig.getMockEnable()) {
      _instance._repository = MockHttpRepository.instance;
    } else {
      _instance._repository = ApiHttpRepository();
    }
  }

  static Future<BaseEntity<TestEntity>> test() {
    return _instance._repository.test();
  }
}