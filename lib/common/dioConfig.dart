import 'common.dart';

//api 版本
enum ApiVersion {
  def, v1, v2, v3
}

//api版本扩展获取工具
extension ApiVersinoExtension on ApiVersion {
  String get value {
    switch (this) {
      case ApiVersion.v1:
        return "v1";
      case ApiVersion.def:
        return "v1";
      case ApiVersion.v2:
        return "v2";
      case ApiVersion.v3:
        return "v3";
      default:
        return "v1";
    }
  }
}


class DomainConfig {
  //正式域名
  static const String _FORMAL_DOMAIN = '';

  //开发域名
  static const String _DEVELOP_DOMAIN = 'http://192.168.0.113:3002/mock/14';

  //api 前置
  static const String _apiPrefix = 'apps/api/';

  //获取正式域名
  static String getFormalDomain() {
    return _FORMAL_DOMAIN;
  }

  //获取开发域名
  static String getDevelopDomain() {
    return _DEVELOP_DOMAIN;
  }

  //获取域名
  static String getDomain() {
    String domain;
    if (AppConfig.hasProductEnv()) {
      domain =  getDevelopDomain();
    } else {
      domain = getFormalDomain();
    }

    return getApiPrefix(domain);
  }

  //获取域名前置
  static String getApiPrefix(String domain) {
    return "$domain/$_apiPrefix";
  }
}

//设置代理
class ProxyConfig {
  static final String _proxy = "127.0.0.1:8888";

  //获取代理
  static String getProxy() {
    if (AppConfig.hasProductEnv()) {
      return 'DIRECT';
    } else {
      return "PROXY $_proxy";
    }
  }

  static String getProxyPem() {
    if (AppConfig.hasProductEnv()) {
      return 'assets/crt/blog_develop.pem';
    } else {
      return 'assets/crt/charles-proxy-ssl-proxying-certificate.pem';
    }
  }
}


/// 默认dio配置
class DioConfig {
  static final int connectTimeout = 15000;
  static final int receiveTimeout = 15000;
  static final int sendTimeout = 10000;

  static getDomain() {
    return DomainConfig.getDomain();
  }

  static getProxy() {
    return ProxyConfig.getProxy();
  }

  static getProxyPem() {
    return ProxyConfig.getProxyPem();
  }
}

///响应格式工具
class ResponseFormat {
  static const String data = 'data';
  static const String message = 'message';
  static const String code = 'code';
}

//
class Token {
  static const String accessToken = 'accessToken';
  static const String refreshToken = 'refreshToken';
}



