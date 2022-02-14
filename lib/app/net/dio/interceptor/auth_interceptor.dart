import 'package:dio/dio.dart';
import 'package:qi_yang/app/net/const/net_token_const.dart';
import 'package:qi_yang/tools/singleton/sp_singleton.dart' show SpSingleton;

//在请求同增加 Authorization
class AuthInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final String? accessToken = SpSingleton.getString(NetTokenConst.loginAuthToken);
    if (accessToken!.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $accessToken';
    }

    return super.onRequest(options, handler);
  }
}