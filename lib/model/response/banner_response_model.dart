import 'package:QiYang/generated/json/base/json_convert_content.dart';
import 'package:QiYang/generated/json/base/json_field.dart';

class BannerResponseModel with JsonConvert<BannerResponseModel> {
	@JSONField(name: "updated_at")
	String updatedAt;
	@JSONField(name: "banners_len")
	int bannersLen;
	List<BannerResponseBanners> banners;
}

class BannerResponseBanners with JsonConvert<BannerResponseBanners> {
	@JSONField(name: "jump_address")
	String jumpAddress;
	int order;
	String title;
	String desc;
	String url;
}
