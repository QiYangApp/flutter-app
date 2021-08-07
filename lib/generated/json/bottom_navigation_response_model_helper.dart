import 'package:QiYang/model/response/bottom_navigation_response_model.dart';

bottomNavigationResponseModelFromJson(BottomNavigationResponseModel data, Map<String, dynamic> json) {
	if (json['updated_at'] != null) {
		data.updatedAt = json['updated_at'].toString();
	}
	if (json['index'] != null) {
		data.index = json['index'] is String
				? int.tryParse(json['index'])
				: json['index'].toInt();
	}
	if (json['tabs'] != null) {
		data.tabs = (json['tabs'] as List).map((v) => BottomNavigationResponseTabs().fromJson(v)).toList();
	}
	return data;
}

Map<String, dynamic> bottomNavigationResponseModelToJson(BottomNavigationResponseModel entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['updated_at'] = entity.updatedAt;
	data['index'] = entity.index;
	data['tabs'] =  entity.tabs?.map((v) => v.toJson())?.toList();
	return data;
}

bottomNavigationResponseTabsFromJson(BottomNavigationResponseTabs data, Map<String, dynamic> json) {
	if (json['title'] != null) {
		data.title = json['title'].toString();
	}
	if (json['route'] != null) {
		data.route = json['route'].toString();
	}
	if (json['display'] != null) {
		data.display = json['display'];
	}
	if (json['sort'] != null) {
		data.sort = json['sort'] is String
				? int.tryParse(json['sort'])
				: json['sort'].toInt();
	}
	if (json['icon'] != null) {
		data.icon = json['icon'].toString();
	}
	if (json['mes'] != null) {
		data.mes = json['mes'].toString();
	}
	return data;
}

Map<String, dynamic> bottomNavigationResponseTabsToJson(BottomNavigationResponseTabs entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['title'] = entity.title;
	data['route'] = entity.route;
	data['display'] = entity.display;
	data['sort'] = entity.sort;
	data['icon'] = entity.icon;
	data['mes'] = entity.mes;
	return data;
}