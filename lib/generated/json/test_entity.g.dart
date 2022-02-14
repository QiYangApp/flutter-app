import 'package:qi_yang/generated/json/base/json_convert_content.dart';
import 'package:qi_yang/models/response/test_entity.dart';

TestEntity $TestEntityFromJson(Map<String, dynamic> json) {
	final TestEntity testEntity = TestEntity();
	final int? test = jsonConvert.convert<int>(json['test']);
	if (test != null) {
		testEntity.test = test;
	}
	return testEntity;
}

Map<String, dynamic> $TestEntityToJson(TestEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['test'] = entity.test;
	return data;
}