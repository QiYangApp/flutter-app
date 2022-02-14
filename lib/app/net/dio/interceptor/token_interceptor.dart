import 'dart:io';
import 'package:dio/dio.dart';
import 'package:qi_yang/app/net/const/net_token_const.dart';
import 'package:qi_yang/app/net/const/response_format.dart';
import 'package:qi_yang/app/net/dio/dio_manage.dart';
import 'package:qi_yang/app/net/http_repository_manage.dart';
import 'package:qi_yang/tools/singleton/log_singleton.dart';
import 'package:qi_yang/tools/singleton/sp_singleton.dart';


class TokenInterceptor extends Interceptor {
  // Future getToken() async {
  //   final String? refreshToken = SpSingleton.getString(NetTokenConst.refreshToken);
  //   if (refreshToken == null || refreshToken.isEmpty) {
  //     return false;
  //   }
  //
  //   HttpRepositoryManage
  //
  //   try {
  //     _tokenDio.options = DioUtils.instance.dio.options;
  //     final Response response = await _tokenDio.post('lgn/refreshToken', data: params);
  //     if (response.statusCode == ExceptionHandle.success) {
  //       return json.decode(response.data.toString())['access_token'];
  //     }
  //   } catch(e) {
  //     Log.e('刷新Token失败！');
  //   }
  //
  //   return '';
  // }
  //
  // Future<Object> retry(Response response, String accessToken) async {
  //   // 重新请求失败接口
  //   final RequestOptions opts = response.requestOptions;
  //   opts.headers['Authorization'] = 'Bearer $accessToken';
  //
  //   Log.e('----------- 重新请求接口 ------------');
  //   try {
  //     /// 避免重复执行拦截器，使用tokenDio
  //     response = await _tokenDio.request(opts.path,
  //         data: opts.data,
  //         queryParameters: opts.queryParameters,
  //         cancelToken: opts.cancelToken,
  //         options: opts as Options,
  //         onReceiveProgress: opts.onReceiveProgress);
  //   } on DioError catch (e) {
  //     return e;
  //   }
  //
  //    return response;
  // }

  // @override
  // Future<void> onResponse(Response response, ResponseInterceptorHandler handler) async {
  //   if (response.statusCode == HttpStatus.unauthorized) {
  //     LogSingleton.d('-----------自动刷新Token------------');
  //     final repository =  HttpRepositoryManage.refreshToken();
  //
  //     HttpRepositoryManage.refreshToken().then((value) {
  //     });
  //     httpRepositoryManage.refreshToken();
  //     final Dio dio = DioManage.getDio();
  //
  //     dio.interceptors.requestLock.lock();
  //     _tokenDio.interceptors.responseLock.lock();
  //
  //     final String accessToken = await getToken();
  //
  //     Log.e('-----------NewToken: $accessToken ------------');
  //     SpUtil.putString(Token.accessToken, accessToken);
  //     dio.interceptors.requestLock.unlock();
  //     _tokenDio.interceptors.responseLock.lock();
  //
  //     response = await retry(response, accessToken);
  //   }
  //
  //   return super.onResponse(response, handler);
  // }
}