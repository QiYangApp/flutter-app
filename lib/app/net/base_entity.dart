// class BaseEntity<T> {
//   int code;
//   String message;
//   T data;
//
//   BaseEntity.fromJson(Map<String, dynamic> json) {
//     code = json[ResponseFormat.code] as int;
//     message = json[ResponseFormat.message] as String;
//
//     if (json.containsKey(ResponseFormat.data)) {
//       data = JsonConvert.fromJsonAsT(json[ResponseFormat.data]);
//     }
//   }
//
//   @override
//   String toString() {
//     StringBuffer sb = new StringBuffer('{');
//     sb.write(",\"code\":$code");
//     sb.write(",\"message\":$message");
//     sb.write(",\"data\":\"$data\"");
//     sb.write('}');
//     return sb.toString();
//   }
// }
