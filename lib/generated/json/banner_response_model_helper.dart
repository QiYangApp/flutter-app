import 'package:QiYang/model/response/banner_response_model.dart';

bannerResponseModelFromJson(BannerResponseModel data, Map<String, dynamic> json) {
	if (json['updated_at'] != null) {
		data.updatedAt = json['updated_at'].toString();
	}
	if (json['banners_len'] != null) {
		data.bannersLen = json['banners_len'] is String
				? int.tryParse(json['banners_len'])
				: json['banners_len'].toInt();
	}
	if (json['banners'] != null) {
		data.banners = (json['banners'] as List).map((v) => BannerResponseBanners().fromJson(v)).toList();
	}
	return data;
}

Map<String, dynamic> bannerResponseModelToJson(BannerResponseModel entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['updated_at'] = entity.updatedAt;
	data['banners_len'] = entity.bannersLen;
	data['banners'] =  entity.banners?.map((v) => v.toJson())?.toList();
	return data;
}

bannerResponseBannersFromJson(BannerResponseBanners data, Map<String, dynamic> json) {
	if (json['jump_address'] != null) {
		data.jumpAddress = json['jump_address'].toString();
	}
	if (json['order'] != null) {
		data.order = json['order'] is String
				? int.tryParse(json['order'])
				: json['order'].toInt();
	}
	if (json['title'] != null) {
		data.title = json['title'].toString();
	}
	if (json['desc'] != null) {
		data.desc = json['desc'].toString();
	}
	if (json['url'] != null) {
		data.url = json['url'].toString();
	}
	return data;
}

Map<String, dynamic> bannerResponseBannersToJson(BannerResponseBanners entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['jump_address'] = entity.jumpAddress;
	data['order'] = entity.order;
	data['title'] = entity.title;
	data['desc'] = entity.desc;
	data['url'] = entity.url;
	return data;
}