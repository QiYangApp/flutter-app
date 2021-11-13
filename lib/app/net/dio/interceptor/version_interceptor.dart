import 'package:dio/dio.dart';
import 'package:qi_yang/app/config/app_config.dart';

class VersionInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final String apiVersion = AppConfig.version;
    options.headers[Headers.acceptHeader] =
        "application/vnd.heroku+json; version=$apiVersion";
    return super.onRequest(options, handler);
  }
}
