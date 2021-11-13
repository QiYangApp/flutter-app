import 'package:dio/dio.dart';
import 'package:qi_yang/app/config/net_config.dart';
import 'package:qi_yang/app/net/repository/abstract_http_repository.dart';
import 'package:qi_yang/app/net/repository/api_http_repository.dart';
import 'package:qi_yang/app/net/repository/mock_http_repository.dart';

class HttpRepositoryManage {
  static final HttpRepositoryManage _singleton = HttpRepositoryManage._();

  static HttpRepositoryManage get instance => HttpRepositoryManage();

  factory HttpRepositoryManage() => _singleton;

  static late AbstractHttpRepository _repository;

  static AbstractHttpRepository get repository => _repository;

  Dio? getDio() {
    if (NetConfig.getMockEnable()) {
      return null;
    }

    return (_repository as ApiHttpRepository).dio;
  }

  HttpRepositoryManage._() {
    if (NetConfig.getMockEnable()) {
      _repository = MockHttpRepository.instance;
    } else {
      _repository = ApiHttpRepository.instance;
    }
  }
}