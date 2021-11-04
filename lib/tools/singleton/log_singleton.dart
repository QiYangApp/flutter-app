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
  /// Log a message at level [Level.verbose].
  static void v(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    _prefs.v(message, error, stackTrace);
  }

  /// Log a message at level [Level.debug].
  static void d(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    _prefs.d(message, error, stackTrace);
  }

  /// Log a message at level [Level.info].
  static void i(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    _prefs.i(message, error, stackTrace);
  }

  /// Log a message at level [Level.warning].
  static void w(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    _prefs.w(message, error, stackTrace);
  }

  /// Log a message at level [Level.error].
  static void e(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    _prefs.e(message, error, stackTrace);
  }

  /// Log a message at level [Level.wtf].
  static void wtf(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    _prefs.wtf(message, error, stackTrace);
  }
}