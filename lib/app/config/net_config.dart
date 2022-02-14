import 'package:flutter_config/flutter_config.dart';

class NetConfig {
  //域名
  static final String _domain = FlutterConfig.get('API_URL');

  //是否启用mock
  static final String _mockEnable = FlutterConfig.get('APP_MOCK_ENABLE');

  //获取域名
  static String getAppUrl() {
    return _domain;
  }

  //获取mock状态
  static bool getMockEnable() {
    return _mockEnable == 'true';
  }

  //获取 web view page address
  static String getWebViewPage() {
    return FlutterConfig.get('WEB_VIEW_PAGE');
  }
}

class ProxyConfig {
  //代理地址
  static final String _domain = FlutterConfig.get('API_PROXY');

  //是否代理开启
  static final bool _enable = FlutterConfig.get('API_PROXY_ENABLE');

  //代理 pem 证书
  static final String _pem = FlutterConfig.get('API_PEM');

  //获取代理 pem 证书
  static String getProxyPem() {
    return _pem;
  }

  //获取代理设置
  static String getProxy() {
    return _enable == false ? 'DIRECT' : "PROXY $_domain";
  }
}
