import 'dart:convert';

import 'package:crypto/crypto.dart';

class CryptoUtil {

  //密码加密
  String passwd(String passwd) {
    var key = utf8.encode('p@ssw0rd-passwd');
    var bytes = utf8.encode(passwd);

    return crypto(bytes, key);
  }

  //加密
  String crypto(List<int> text, List<int> key) {
    return Hmac(sha256, key).convert(text).toString();
  }
}