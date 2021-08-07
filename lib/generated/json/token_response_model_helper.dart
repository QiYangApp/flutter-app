import 'package:QiYang/model/response/token_response_model.dart';

tokenResponseModelFromJson(TokenResponseModel data, Map<String, dynamic> json) {
	if (json['token'] != null) {
		data.token = json['token'].toString();
	}
	return data;
}

Map<String, dynamic> tokenResponseModelToJson(TokenResponseModel entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['token'] = entity.token;
	return data;
}