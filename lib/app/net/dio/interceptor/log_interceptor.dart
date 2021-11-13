
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:qi_yang/tools/singleton/log_singleton.dart';

class LogInterceptor extends Interceptor{

  late DateTime _startTime;
  late DateTime _endTime;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    _startTime = DateTime.now();
    LogSingleton.d('----------Start----------');
    if (options.queryParameters.isEmpty) {
      LogSingleton.d('RequestUrl: ' + options.baseUrl + options.path);
    } else {
      LogSingleton.d('RequestUrl: ' + options.baseUrl + options.path + '?' + Transformer.urlEncodeMap(options.queryParameters));
    }
    LogSingleton.d('RequestMethod: ' + options.method);
    LogSingleton.d('RequestHeaders:' + options.headers.toString());
    LogSingleton.d('RequestContentType: ${options.contentType}');
    LogSingleton.d('RequestData: ${options.data.toString()}');

    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    _endTime = DateTime.now();
    int duration = _endTime.difference(_startTime).inMilliseconds;
    if (response.statusCode == HttpStatus.ok) {
      LogSingleton.d('ResponseCode: ${response.statusCode}');
    } else {
      LogSingleton.e('ResponseCode: ${response.statusCode}');
    }
    // 输出结果
    LogSingleton.d(response.data.toString());
    LogSingleton.d('----------End: $duration 毫秒----------');
    return super.onResponse(response, handler);
  }

  @override
  void onError(DioError err,ErrorInterceptorHandler handler) {
    LogSingleton.d('----------Error-----------');
    return super.onError(err, handler);
  }
}