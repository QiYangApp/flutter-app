import 'package:QiYang/model/response/guide_page_response_model.dart';

guidePageResponseModelFromJson(GuidePageResponseModel data, Map<String, dynamic> json) {
	if (json['updated_at'] != null) {
		data.updatedAt = json['updated_at'].toString();
	}
	if (json['jump_page'] != null) {
		data.jumpPage = json['jump_page'].toString();
	}
	if (json['images'] != null) {
		data.images = (json['images'] as List).map((v) => GuidePageResponseImages().fromJson(v)).toList();
	}
	return data;
}

Map<String, dynamic> guidePageResponseModelToJson(GuidePageResponseModel entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['updated_at'] = entity.updatedAt;
	data['jump_page'] = entity.jumpPage;
	data['images'] =  entity.images?.map((v) => v.toJson())?.toList();
	return data;
}

guidePageResponseImagesFromJson(GuidePageResponseImages data, Map<String, dynamic> json) {
	if (json['title'] != null) {
		data.title = json['title'].toString();
	}
	if (json['url'] != null) {
		data.url = json['url'].toString();
	}
	if (json['description'] != null) {
		data.description = json['description'].toString();
	}
	if (json['order'] != null) {
		data.order = json['order'] is String
				? int.tryParse(json['order'])
				: json['order'].toInt();
	}
	return data;
}

Map<String, dynamic> guidePageResponseImagesToJson(GuidePageResponseImages entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['title'] = entity.title;
	data['url'] = entity.url;
	data['description'] = entity.description;
	data['order'] = entity.order;
	return data;
}