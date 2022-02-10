import 'package:qi_yang/generated/json/base/json_convert_content.dart';
import 'package:qi_yang/generated/json/base/json_field.dart';

class StartPageResponseModel with JsonConvert<StartPageResponseModel> {
	@JSONField(name: "background_picture")
	String backgroundPicture;
	@JSONField(name: "splash_type")
	int splashType;
	@JSONField(name: "splash_screen_time")
	int splashScreenTime;
	@JSONField(name: "jump_link")
	String jumpLink;
	@JSONField(name: "updated_at")
	String updatedAt;
}
