import 'package:qi_yang/generated/json/base/json_convert_content.dart';
import 'package:qi_yang/generated/json/base/json_field.dart';

class ArticleClassifyResponseModel with JsonConvert<ArticleClassifyResponseModel> {
	@JSONField(name: "current_page")
	int currentPage;
	@JSONField(name: "current_number")
	int currentNumber;
	@JSONField(name: "total_page")
	int totalPage;
	List<ArticleClassifyResponseData> data;
}

class ArticleClassifyResponseData with JsonConvert<ArticleClassifyResponseData> {
	String title;
	String desc;
	String resource;
	bool attention;
	int see;
	@JSONField(name: "agree_with")
	int agreeWith;
	@JSONField(name: "author_name")
	String authorName;
	@JSONField(name: "created_at")
	String createdAt;
	@JSONField(name: "article_id")
	String articleId;
	@JSONField(name: "article_classify")
	String articleClassify;
	String avatar;
}
