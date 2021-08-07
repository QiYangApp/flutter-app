import 'package:QiYang/model/response/start_page_response_model.dart';

startPageResponseModelFromJson(StartPageResponseModel data, Map<String, dynamic> json) {
	if (json['background_picture'] != null) {
		data.backgroundPicture = json['background_picture'].toString();
	}
	if (json['splash_type'] != null) {
		data.splashType = json['splash_type'] is String
				? int.tryParse(json['splash_type'])
				: json['splash_type'].toInt();
	}
	if (json['splash_screen_time'] != null) {
		data.splashScreenTime = json['splash_screen_time'] is String
				? int.tryParse(json['splash_screen_time'])
				: json['splash_screen_time'].toInt();
	}
	if (json['jump_link'] != null) {
		data.jumpLink = json['jump_link'].toString();
	}
	if (json['updated_at'] != null) {
		data.updatedAt = json['updated_at'].toString();
	}
	return data;
}

Map<String, dynamic> startPageResponseModelToJson(StartPageResponseModel entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['background_picture'] = entity.backgroundPicture;
	data['splash_type'] = entity.splashType;
	data['splash_screen_time'] = entity.splashScreenTime;
	data['jump_link'] = entity.jumpLink;
	data['updated_at'] = entity.updatedAt;
	return data;
}