import 'package:sprintf/sprintf.dart';

class BannerConst {
  static const String _key = 'banner-%s';

  //获取 banner key
  static getKey(String key) {
    return sprintf(_key, [key]);
  }
}