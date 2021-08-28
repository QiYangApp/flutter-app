import 'dart:convert' as convert;
import 'package:common_utils/common_utils.dart';
import 'package:QiYang/common/common.dart';


//日志工具
class Log  {
  static const String tag = 'DEER-LOG';

  static void startLog(String mes) {
    v(">>>>>>>>>>>>> $mes <<<<<<<<<<<<<", tag: "init");
  }

  static void init() {
    LogUtil.init(isDebug: AppConfig.hasProductEnv());
  }

  static void v(Object msg, {String tag = tag}) {
    if (AppConfig.hasProductEnv()) {
      LogUtil.v(msg, tag: tag);
    }
  }

  static void d(String msg, {String tag = tag}) {
    if (AppConfig.hasProductEnv()) {
      LogUtil.v(msg, tag: tag);
    }
  }

  static void e(String msg, {String tag = tag}) {
    if (AppConfig.hasProductEnv()) {
      LogUtil.e(msg, tag: tag);
    }
  }

  static void json(String msg, {String tag = tag}) {
    if (AppConfig.hasProductEnv()) {
      final dynamic data = convert.json.decode(msg);

      if (data is Map) {
        _printMap(data);
      } else if (data is List) {
        _printList(data);
      } else
        LogUtil.v(msg, tag: tag);
    }
  }

  static void _printMap(Map data, {String tag = tag, int tabs = 1, bool isListItem = false, bool isLast}) {
    final bool isRoot = tabs == 1;
    final String initialIndex = _indent(tabs);

    tabs++;

    if (isRoot || isListItem) LogUtil.v('$initialIndex{', tag: tag);

    data.keys.toList().asMap().forEach((index, key) {
      final bool isLast = index == data.length - 1;

      var value = data[key];
      if (value is String) value = '\"$value\"';
      if (value is Map) {
        if (value.length == 0)
          LogUtil.v('${_indent(tabs)} $key: $value${!isLast ? ',' : ''}', tag: tag);
      }

    });
  }

  static void _printList(List list, {String tag = tag, int tabs = 1}) {
    list.asMap().forEach((i, e) {
      final bool isLast = i == list.length - 1;
      if (e is Map) {
        if (e.length == 0) {
          LogUtil.v('${_indent(tabs)}  $e${!isLast ? ',' : ''}', tag: tag);
        } else {
          _printMap(e, tabs: tabs + 1, isListItem: true, isLast: isLast);
        }
      } else {
        LogUtil.v('${_indent(tabs + 2)} $e${isLast ? '' : ','}', tag: tag);
      }
    });
  }

  static String _indent([int tabCount = 1]) => '  ' * tabCount;

}