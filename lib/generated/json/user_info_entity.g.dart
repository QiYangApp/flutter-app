import 'package:qi_yang/generated/json/base/json_convert_content.dart';
import 'package:qi_yang/models/response/user_info_entity.dart';

UserInfoEntity $UserInfoEntityFromJson(Map<String, dynamic> json) {
	final UserInfoEntity userInfoEntity = UserInfoEntity();
	final String? id = jsonConvert.convert<String>(json['id']);
	if (id != null) {
		userInfoEntity.id = id;
	}
	final String? name = jsonConvert.convert<String>(json['name']);
	if (name != null) {
		userInfoEntity.name = name;
	}
	final String? avatar = jsonConvert.convert<String>(json['avatar']);
	if (avatar != null) {
		userInfoEntity.avatar = avatar;
	}
	return userInfoEntity;
}

Map<String, dynamic> $UserInfoEntityToJson(UserInfoEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['id'] = entity.id;
	data['name'] = entity.name;
	data['avatar'] = entity.avatar;
	return data;
}