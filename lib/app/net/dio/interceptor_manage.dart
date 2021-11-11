

import 'package:dio/dio.dart';

import 'interceptor/auth_interceptor.dart';

class InterceptorManage {

  late List<Interceptor> interceptor;

  InterceptorManage.init({List<Interceptor>? interceptor}) {
    this.interceptor = _merge(interceptor);
  }

  List<Interceptor> getInterceptors() {
    return interceptor;
  }

  static List<Interceptor> _merge(List<Interceptor>? interceptor) {
    if (interceptor == null) {
      return getDefaultInterceptor();
    }

    return [...getDefaultInterceptor(), ...interceptor];
  }

  static List<Interceptor> getDefaultInterceptor() {
    return [
      AuthInterceptor(),
    ];
  }
}