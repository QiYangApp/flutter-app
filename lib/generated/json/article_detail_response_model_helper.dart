import 'package:QiYang/model/response/article_detail_response_model.dart';

articleDetailResponseModelFromJson(ArticleDetailResponseModel data, Map<String, dynamic> json) {
	if (json['article_id'] != null) {
		data.articleId = json['article_id'].toString();
	}
	if (json['avatar'] != null) {
		data.avatar = json['avatar'].toString();
	}
	if (json['author_name'] != null) {
		data.authorName = json['author_name'].toString();
	}
	if (json['publish_time'] != null) {
		data.publishTime = json['publish_time'].toString();
	}
	if (json['content'] != null) {
		data.content = json['content'].toString();
	}
	if (json['title'] != null) {
		data.title = json['title'].toString();
	}
	if (json['watch'] != null) {
		data.watch = json['watch'] is String
				? int.tryParse(json['watch'])
				: json['watch'].toInt();
	}
	return data;
}

Map<String, dynamic> articleDetailResponseModelToJson(ArticleDetailResponseModel entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['article_id'] = entity.articleId;
	data['avatar'] = entity.avatar;
	data['author_name'] = entity.authorName;
	data['publish_time'] = entity.publishTime;
	data['content'] = entity.content;
	data['watch'] = entity.watch;
	data['title'] = entity.title;
	return data;
}