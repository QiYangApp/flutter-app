

import 'package:dio/dio.dart';
import 'package:qi_yang/tools/network/interceptor/authInterceptor.dart';

class DioInterceptor {

  late List<Interceptor> interceptor;

  DioInterceptor.init({List<Interceptor>? interceptor}) {
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
      // AuthInterceptor(),
    ];
  }
}