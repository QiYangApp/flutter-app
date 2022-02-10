import 'package:qi_yang/generated/json/base/json_convert_content.dart';
import 'package:qi_yang/generated/json/base/json_field.dart';

class BottomNavigationResponseModel with JsonConvert<BottomNavigationResponseModel> {
	@JSONField(name: "updated_at")
	String updatedAt;
	int index;
	List<BottomNavigationResponseTabs> tabs;
}

class BottomNavigationResponseTabs with JsonConvert<BottomNavigationResponseTabs> {
	String title;
	String route;
	bool display;
	int sort;
	String icon;
	String mes;
}
