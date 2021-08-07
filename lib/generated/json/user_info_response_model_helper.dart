import 'package:QiYang/model/response/user_info_response_model.dart';

userInfoResponseModelFromJson(UserInfoResponseModel data, Map<String, dynamic> json) {
	if (json['nickname'] != null) {
		data.nickname = json['nickname'].toString();
	}
	if (json['avatar'] != null) {
		data.avatar = json['avatar'].toString();
	}
	return data;
}

Map<String, dynamic> userInfoResponseModelToJson(UserInfoResponseModel entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['nickname'] = entity.nickname;
	data['avatar'] = entity.avatar;
	return data;
}