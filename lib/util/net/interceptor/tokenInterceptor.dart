import 'dart:io';
import 'package:dio/dio.dart';
import 'package:QiYang/common/dioConfig.dart';
import 'package:sp_util/sp_util.dart';

import '../../log_utils.dart';
import '../dio_utils.dart';

class TokenInterceptor extends Interceptor {
  Dio _tokenDio = Dio();

  Future<String> getToken() async {
    return '';
  }

  Future<Response> retry(Response response, String accessToken) async {
    // 重新请求失败接口
    // final RequestOptions request = response.requestOptions;
    // request.headers['Authorization'] = 'Bearer $accessToken';
    //
    // Log.e('----------- 重新请求接口 ------------');
    // /// 避免重复执行拦截器，使用tokenDio
    // final Response response = await _tokenDio.request(request.path,
    //     data: request.data,
    //     queryParameters: request.queryParameters,
    //     cancelToken: request.cancelToken,
    //     // options: request,
    //     onReceiveProgress: request.onReceiveProgress);
    return response;
  }

  @override
  Future<void> onResponse(Response response, ResponseInterceptorHandler handler) async {
    if (response != null && response.statusCode == HttpStatus.unauthorized) {
      Log.d('-----------自动刷新Token------------');
      final Dio dio = DioUtils.instance.dio;
      dio.interceptors.requestLock.lock();
      final String accessToken = await getToken();
      SpUtil.putString(Token.accessToken, accessToken);

      Log.e('-----------NewToken: $accessToken ------------');

      response = await retry(response, accessToken);
    }

    return super.onResponse(response, handler);
  }
}