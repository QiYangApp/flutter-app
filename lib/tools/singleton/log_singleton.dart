import 'dart:async';

import 'package:logger/logger.dart';
import 'package:synchronized/synchronized.dart';

class LogSingleton {
  LogSingleton._internal();

  static final LogSingleton _instance = LogSingleton._internal();

  late Logger _prefs;

  static init() async {
    _instance._prefs = Logger();
  }

  /// Log a message at level [Level.verbose].
  static void v(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    _instance._prefs.v(message, error, stackTrace);
  }

  /// Log a message at level [Level.debug].
  static void d(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    _instance._prefs.d(message, error, stackTrace);
  }

  /// Log a message at level [Level.info].
  static void i(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    _instance._prefs.i(message, error, stackTrace);
  }

  /// Log a message at level [Level.warning].
  static void w(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    _instance._prefs.w(message, error, stackTrace);
  }

  /// Log a message at level [Level.error].
  static void e(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    _instance._prefs.e(message, error, stackTrace);
  }

  /// Log a message at level [Level.wtf].
  static void wtf(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    _instance._prefs.wtf(message, error, stackTrace);
  }
}
