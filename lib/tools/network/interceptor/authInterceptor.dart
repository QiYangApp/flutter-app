import 'package:dio/dio.dart';

//在请求同增加 Authorization
class AuthInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final String accessToken = SpUtil.getString(Token.accessToken);
    if (accessToken.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $accessToken';
    }

    return super.onRequest(options, handler);
  }
}