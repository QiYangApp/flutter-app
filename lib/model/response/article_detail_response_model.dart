import 'package:QiYang/generated/json/base/json_convert_content.dart';
import 'package:QiYang/generated/json/base/json_field.dart';

class ArticleDetailResponseModel with JsonConvert<ArticleDetailResponseModel> {
	@JSONField(name: "article_id")
	String articleId;
	String avatar;
	@JSONField(name: "author_name")
	String authorName;
	@JSONField(name: "publish_time")
	String publishTime;
	String content;
	int watch;
	String title;
}
