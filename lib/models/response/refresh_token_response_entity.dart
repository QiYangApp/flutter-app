import 'dart:convert';
import 'package:qi_yang/generated/json/base/json_field.dart';
import 'package:qi_yang/generated/json/refresh_token_response_entity.g.dart';

@JsonSerializable()
class RefreshTokenResponseEntity {

	String? token;
  
  RefreshTokenResponseEntity();

  factory RefreshTokenResponseEntity.fromJson(Map<String, dynamic> json) => $RefreshTokenResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => $RefreshTokenResponseEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}