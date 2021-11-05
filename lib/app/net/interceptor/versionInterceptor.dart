import 'package:QiYang/common/dioConfig.dart';
import 'package:dio/dio.dart';

class VersionInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['Accept'] =
        "application/vnd.heroku+json; version=${ApiVersion.def.value}";
    return super.onRequest(options, handler);
  }
}
