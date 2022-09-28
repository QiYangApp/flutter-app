import 'dart:convert';
import 'package:qi_yang/generated/json/base/json_field.dart';
import 'package:qi_yang/generated/json/user_info_entity.g.dart';

@JsonSerializable()
class UserInfoEntity {

	String? id;
	String? name;
	String? avatar;
  
  UserInfoEntity();

  factory UserInfoEntity.fromJson(Map<String, dynamic> json) => $UserInfoEntityFromJson(json);

  Map<String, dynamic> toJson() => $UserInfoEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}