import 'dart:async';

import 'package:logger/logger.dart';
import 'package:synchronized/synchronized.dart';

class LogSingleton {
  static late LogSingleton _singleton;
  static late Logger _prefs;
  static final Lock _lock = Lock();

  static Future<LogSingleton> getInstance() async {
    if (_singleton == null) {
      await _lock.synchronized(() async {
        if (_singleton == null) {
          var singleton = LogSingleton._();
          await singleton._init();
          _singleton = singleton;
        }
      });
    }

    return _singleton;
  }

  LogSingleton._();

  Future _init() async {
    _prefs = Logger();
  }

  static v(String mes) {
    _prefs.v(mes);
  }
}