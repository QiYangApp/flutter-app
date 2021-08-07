import 'package:QiYang/model/response/article_classify_response_model.dart';

articleClassifyResponseModelFromJson(ArticleClassifyResponseModel data, Map<String, dynamic> json) {
	if (json['current_page'] != null) {
		data.currentPage = json['current_page'] is String
				? int.tryParse(json['current_page'])
				: json['current_page'].toInt();
	}
	if (json['current_number'] != null) {
		data.currentNumber = json['current_number'] is String
				? int.tryParse(json['current_number'])
				: json['current_number'].toInt();
	}
	if (json['total_page'] != null) {
		data.totalPage = json['total_page'] is String
				? int.tryParse(json['total_page'])
				: json['total_page'].toInt();
	}
	if (json['data'] != null) {
		data.data = (json['data'] as List).map((v) => ArticleClassifyResponseData().fromJson(v)).toList();
	}
	return data;
}

Map<String, dynamic> articleClassifyResponseModelToJson(ArticleClassifyResponseModel entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['current_page'] = entity.currentPage;
	data['current_number'] = entity.currentNumber;
	data['total_page'] = entity.totalPage;
	data['data'] =  entity.data?.map((v) => v.toJson())?.toList();
	return data;
}

articleClassifyResponseDataFromJson(ArticleClassifyResponseData data, Map<String, dynamic> json) {
	if (json['title'] != null) {
		data.title = json['title'].toString();
	}
	if (json['desc'] != null) {
		data.desc = json['desc'].toString();
	}
	if (json['resource'] != null) {
		data.resource = json['resource'].toString();
	}
	if (json['attention'] != null) {
		data.attention = json['attention'];
	}
	if (json['author_name'] != null) {
		data.authorName = json['author_name'].toString();
	}
	if (json['created_at'] != null) {
		data.createdAt = json['created_at'].toString();
	}
	if (json['article_id'] != null) {
		data.articleId = json['article_id'] is String
				? int.tryParse(json['article_id'])
				: json['article_id'].toInt();
	}
	if (json['article_classify'] != null) {
		data.articleClassify = json['article_classify'].toString();
	}
	if (json['avatar'] != null) {
		data.avatar = json['avatar'].toString();
	}
	return data;
}

Map<String, dynamic> articleClassifyResponseDataToJson(ArticleClassifyResponseData entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['title'] = entity.title;
	data['desc'] = entity.desc;
	data['resource'] = entity.resource;
	data['attention'] = entity.attention;
	data['author_name'] = entity.authorName;
	data['created_at'] = entity.createdAt;
	data['article_id'] = entity.articleId;
	data['article_classify'] = entity.articleClassify;
	data['avatar'] = entity.avatar;
	return data;
}