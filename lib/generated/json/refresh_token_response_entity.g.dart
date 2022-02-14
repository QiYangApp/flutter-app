import 'package:qi_yang/generated/json/base/json_convert_content.dart';
import 'package:qi_yang/models/response/refresh_token_response_entity.dart';

RefreshTokenResponseEntity $RefreshTokenResponseEntityFromJson(Map<String, dynamic> json) {
	final RefreshTokenResponseEntity refreshTokenResponseEntity = RefreshTokenResponseEntity();
	final String? token = jsonConvert.convert<String>(json['token']);
	if (token != null) {
		refreshTokenResponseEntity.token = token;
	}
	return refreshTokenResponseEntity;
}

Map<String, dynamic> $RefreshTokenResponseEntityToJson(RefreshTokenResponseEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['token'] = entity.token;
	return data;
}