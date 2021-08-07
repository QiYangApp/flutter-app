import 'dart:convert';
import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:QiYang/common/common.dart';
import 'package:QiYang/common/dioConfig.dart';

import '../log_utils.dart';
import 'base_entity.dart';
import 'interceptor/authInterceptor.dart';
import 'interceptor/tokenInterceptor.dart';

List<Interceptor> _interceptors = [];

class DioInit {
  static void init({List<Interceptor> interceptors}) {
    _interceptors = [...?interceptors, ...DioInit().getDefaultInterceptor()];
  }

  //获取默认 Interceptor 组件
  List<Interceptor> getDefaultInterceptor() {
    final List<Interceptor> defaultInterceptors = [];

    defaultInterceptors.add(AuthInterceptor());

    defaultInterceptors.add(TokenInterceptor());

    defaultInterceptors.add(LogInterceptor());

    //缓存中间件
    defaultInterceptors.add(DioCacheManager(CacheConfig(
        databaseName: "QiYang",
        defaultMaxAge: Duration(seconds: 180),
        defaultMaxStale: Duration(seconds: 3600),
        baseUrl: DioConfig.getDomain()
    )).interceptor);

    return defaultInterceptors;
  }
}

typedef NetSuccessCallback<T> = Function(T data, BaseEntity response);
typedef NetSuccessListCallback<T> = Function(List<T> data);
typedef NetErrorCallback = Function(int code, String msg);

class DioUtils {
  static DioUtils _singleton = DioUtils._();

  static DioUtils get instance => DioUtils();

  factory DioUtils() => _singleton;

  static Dio _dio;

  Dio get dio => _dio;

  DioUtils._() {
    BaseOptions _options = BaseOptions(
        connectTimeout: DioConfig.connectTimeout,
        receiveTimeout: DioConfig.receiveTimeout,
        sendTimeout: DioConfig.sendTimeout,
        responseType: ResponseType.plain,
        validateStatus: (_) {
          return true;
        },
        baseUrl: DioConfig.getDomain());

    _dio = Dio(_options);

    /// 抓包代理配置
    (_dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.findProxy = (uri) {
        return DioConfig.getProxy();
      };

      // client.badCertificateCallback =
      //     (X509Certificate cert, String host, int port) => true;

      //SSL Pinning 证书认证
      SecurityContext sc = SecurityContext();
      //file is the path of certificate
      dynamic cer = rootBundle.load(DioConfig.getProxyPem());
      sc.setTrustedCertificates(cer);
      HttpClient httpClient = HttpClient(context: sc);
      return httpClient;
    };

    _dio = Dio(_options);

    Log.v(_interceptors);

    /// 添加拦截器
    _interceptors.forEach((interceptor) {
      _dio.interceptors.add(interceptor);
    });
  }

  /// 数据返回格式统一，统一处理异常
  Future<BaseEntity<T>> _request<T>(
    String method,
    String url, {
    dynamic data,
    Map<String, dynamic> queryParameters,
    CancelToken cancelToken,
    Options options,
  }) async {
    final Response<String> response = await _dio.request<String>(
      url,
      data: data,
      queryParameters: queryParameters,
      options: _checkOptions(method, options),
      cancelToken: cancelToken,
    );
    try {
      final String data = response.data.toString();

      /// 集成测试无法使用 isolate https://github.com/flutter/flutter/issues/24703
      /// 使用compute条件：数据大于10KB（粗略使用10 * 1024）且当前不是集成测试（后面可能会根据Web环境进行调整）
      /// 主要目的减少不必要的性能开销
      final bool isCompute = AppConfig.isDriverTest && data.length > 10 * 1024;
      debugPrint('isCompute:$isCompute');
      final Map<String, dynamic> _map =
          isCompute ? await compute(parseData, data) : parseData(data);

      Log.v(_map, tag: "request");

      return BaseEntity<T>.fromJson(_map);
    } catch (e) {
      debugPrint(e.toString());

      return new Future.error(new DioError(
        requestOptions: null,
        response: response,
        type: DioErrorType.response,
        error: "data parsing exception...",
      ));
    }
  }

  Options _checkOptions(String method, Options options) {
    options ??= Options();
    options.method = method;

    return options;
  }

  Future requestNetwork<T>(
    RequestMethod method,
    String url, {
    NetSuccessCallback<T> onSuccess,
    NetErrorCallback onError,
    dynamic params,
    Map<String, dynamic> queryParameters,
    CancelToken cancelToken,
    Options options,
  }) {
    return _request<T>(
      method.value,
      url,
      data: params,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
    ).then((BaseEntity<T> result) {
      if (result.code == 200) {
        if (onSuccess != null) {
          onSuccess(result.data, result);
        }
      }

      return result.data;
    }, onError: (dynamic e) {
      _cancelLogPrint(e, url);
      _onError(e.code, e.message, onError);
    });
  }

  /// 统一处理(onSuccess返回T对象，onSuccessList返回 List<T>)
  void asyncRequestNetwork<T>(
    RequestMethod method,
    String url, {
    NetSuccessCallback<T> onSuccess,
    NetErrorCallback onError,
    dynamic params,
    Map<String, dynamic> queryParameters,
    CancelToken cancelToken,
    Options options,
  }) {
    Stream.fromFuture(_request<T>(
      method.value,
      url,
      data: params,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
    )).asBroadcastStream().listen((result) {
      if (result.code == 0) {
        if (onSuccess != null) {
          onSuccess(result.data, result);
        }
      } else {
        _onError(result.code, result.message, onError);
      }
    }, onError: (dynamic e) {
      _cancelLogPrint(e, url);
      _onError(e.code, e.msg, onError);
    });
  }

  void _cancelLogPrint(dynamic e, String url) {
    if (e is DioError && CancelToken.isCancel(e)) {
      Log.e('取消请求接口： $url');
    }
  }

  void _onError(int code, String msg, NetErrorCallback onError) {
    if (code == null) {
      code = HttpStatus.serviceUnavailable;
      msg = '未知异常';
    }

    Log.e('接口请求异常： code: $code, mag: $msg');
    if (onError != null) {
      onError(code, msg);
    }
  }
}

Map<String, dynamic> parseData(String data) {
  return json.decode(data) as Map<String, dynamic>;
}

enum RequestMethod { get, post, put, patch, delete, head }

/// 使用拓展枚举替代 switch判断取值
/// https://zhuanlan.zhihu.com/p/98545689
extension MethodExtension on RequestMethod {
  String get value => ['GET', 'POST', 'PUT', 'PATCH', 'DELETE', 'HEAD'][index];
}
