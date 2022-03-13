import 'dart:convert';
import 'package:qi_yang/generated/json/base/json_field.dart';
import 'package:qi_yang/generated/json/test_entity.g.dart';

@JsonSerializable()
class TestEntity {

	String? test;
  
  TestEntity();

  factory TestEntity.fromJson(Map<String, dynamic> json) => $TestEntityFromJson(json);

  Map<String, dynamic> toJson() => $TestEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}