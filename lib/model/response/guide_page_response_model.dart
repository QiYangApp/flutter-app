import 'package:qi_yang/generated/json/base/json_convert_content.dart';
import 'package:qi_yang/generated/json/base/json_field.dart';

class GuidePageResponseModel with JsonConvert<GuidePageResponseModel> {
  @JSONField(name: "updated_at")
  String updatedAt;
  @JSONField(name: "jump_page")
  String jumpPage;
  List<GuidePageResponseImages> images;
}

class GuidePageResponseImages with JsonConvert<GuidePageResponseImages> {
  String title;
  String url;
  String description;
  int order;
}
