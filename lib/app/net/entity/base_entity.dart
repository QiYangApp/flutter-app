import 'package:qi_yang/app/net/const/response_format.dart';
import 'package:qi_yang/app/net/entity/pagination_entity.dart';
import 'package:qi_yang/generated/json/base/json_convert_content.dart';

class BaseEntity<T> {
  late int code;
  late String message;
  late T data;
  late PaginationEntity paginationEntity;

  BaseEntity.fromJson(Map<String, dynamic> json) {
    code = json[ResponseFormat.code] as int;
    message = json[ResponseFormat.message] as String;

    if (json.containsKey(ResponseFormat.data)) {
      data = JsonConvert.fromJsonAsT(json[ResponseFormat.data]);
    }

    //分页
    if (json.containsKey(ResponseFormat.pagination)) {
      paginationEntity =
          PaginationEntity.fromJson(json[ResponseFormat.pagination]);
    }
  }

  @override
  String toString() {
    StringBuffer sb = StringBuffer('{');
    sb.write(",\"code\":$code");
    sb.write(",\"message\":$message");
    sb.write(",\"data\":\"$data\"");
    sb.write('}');
    return sb.toString();
  }
}
