import 'package:QiYang/common/dioConfig.dart';

class BaseEntity<T> {
  final Map<String, dynamic> json;

  int code;
  String message;
  T data;

  BaseEntity(this.json) {
    code = json[ResponseFormat.code] as int;
    message = json[ResponseFormat.message] as String;

    if (json.containsKey(ResponseFormat.data)) {
      data = json[ResponseFormat.data];
    }
  }

  @override
  String toString() {
    StringBuffer sb = new StringBuffer('{');
    sb.write(",\"code\":$code");
    sb.write(",\"message\":$message");
    sb.write(",\"data\":\"$data\"");
    sb.write('}');
    return sb.toString();
  }
}
