import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:dio/src/adapters/io_adapter.dart';
import 'package:flutter/services.dart';
import 'package:qi_yang/app/config/net_config.dart';
import 'package:qi_yang/app/net/dio/interceptor_manage.dart';

class DioManage {
  DioManage.internal();

  static final DioManage _instance = DioManage.internal();

  late Dio _dio;

  static init() async {
    _instance._dio = _initDio();
  }

  static Dio getDio() {
    return _instance._dio;
  }

  static Dio _initDio() {
    final Dio dio = Dio(_getOptions());

    //设置代理
    //TODO 待补充
    // (_dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
    //     _getProxy();

    dio.interceptors.addAll(_getInterceptors());

    return dio;
  }

  //获取dio 配置
  static BaseOptions _getOptions() {
    return BaseOptions(
      responseType: ResponseType.json,
      baseUrl: NetConfig.getAppUrlSuffix(),
    );
  }

  //获取请求代理
  static OnHttpClientCreate _getProxy() {
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
  static List<Interceptor> _getInterceptors() {
    return InterceptorManage.init().getInterceptors();
  }
}
