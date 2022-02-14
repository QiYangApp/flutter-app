import 'package:qi_yang/generated/json/base/json_field.dart';
import 'package:qi_yang/generated/json/test_entity.g.dart';


@JsonSerializable()
class TestEntity {

	TestEntity();

	factory TestEntity.fromJson(Map<String, dynamic> json) => $TestEntityFromJson(json);

	Map<String, dynamic> toJson() => $TestEntityToJson(this);

	int? test;
}
