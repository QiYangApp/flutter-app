import 'package:qi_yang/models/response/test_entity.dart';

testEntityFromJson(TestEntity data, Map<String, dynamic> json) {
	if (json['test'] != null) {
		data.test = json['test'] is String
				? int.tryParse(json['test'])
				: json['test'].toInt();
	}
	return data;
}

Map<String, dynamic> testEntityToJson(TestEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['test'] = entity.test;
	return data;
}