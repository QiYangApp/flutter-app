import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:dio/src/adapters/io_adapter.dart';
import 'package:flutter/services.dart';
import 'package:qi_yang/app/config/app_config.dart';
import 'package:qi_yang/app/config/net_config.dart';
import 'package:qi_yang/app/net/dio/interceptor_manage.dart';

class DioManage {
  static final DioManage _singleton = DioManage._();

  static DioManage get instance => DioManage();

  factory DioManage() => _singleton;

  static late Dio _dio;

  Dio get dio => _dio;

  DioManage._() {
    _dio = Dio(_getOptions());

    //设置代理
    (_dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        _getProxy();

    _dio.interceptors.addAll(_getInterceptors());
  }

  //获取dio 配置
  BaseOptions _getOptions() {
    return BaseOptions(
        responseType: ResponseType.json,
        baseUrl: NetConfig.getAppUrlSuffix(),
        headers: _getHeaders());
  }

  //获取请求代理
  OnHttpClientCreate _getProxy() {
    return (HttpClient client) {
      client.findProxy = (url) {
        return ProxyConfig.getProxy();
      };

      //添加pem 证书
      SecurityContext sc = SecurityContext();
      dynamic cer = rootBundle.load(ProxyConfig.getProxyPem());
      sc.setTrustedCertificates(cer);
      HttpClient httpClient = HttpClient(context: sc);

      return httpClient;
    };
  }

  //获取interceptor
  List<Interceptor> _getInterceptors() {
    return InterceptorManage.init().getInterceptors();
  }

  Map<String, String> _getHeaders() {
    final Map<String, String> headers = {};
    final String apiVersion = AppConfig.version;
    headers[Headers.acceptHeader] =
    "application/vnd.heroku+json; version=$apiVersion";

    return headers;
  }
}
