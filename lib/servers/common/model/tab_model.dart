/// updatedAt : "2020-12-12 00:00:00"
/// index : 1
/// tabs : [{"title":"标题","route":"路由","display":true,"sort":1,"icon":1,"mes":1}]

class TabModel {
  String _updatedAt;
  int _index;
  List<Tabs> _tabs;

  String get updatedAt => _updatedAt;
  int get index => _index;
  List<Tabs> get tabs => _tabs;

  TabModel({
      String updatedAt, 
      int index, 
      List<Tabs> tabs}){
    _updatedAt = updatedAt;
    _index = index;
    _tabs = tabs;
}

  TabModel.fromJson(dynamic json) {
    _updatedAt = json["updatedAt"];
    _index = json["index"];
    if (json["tabs"] != null) {
      _tabs = [];
      json["tabs"].forEach((v) {
        _tabs.add(Tabs.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["updatedAt"] = _updatedAt;
    map["index"] = _index;
    if (_tabs != null) {
      map["tabs"] = _tabs.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// title : "标题"
/// route : "路由"
/// display : true
/// sort : 1
/// icon : 1
/// mes : 1

class Tabs {
  String _title;
  String _route;
  bool _display;
  int _sort;
  String _icon;
  int _mes;

  String get title => _title;
  String get route => _route;
  bool get display => _display;
  int get sort => _sort;
  String get icon => _icon;
  int get mes => _mes;

  Tabs({
      String title, 
      String route, 
      bool display, 
      int sort,
    String icon,
      int mes}){
    _title = title;
    _route = route;
    _display = display;
    _sort = sort;
    _icon = icon;
    _mes = mes;
}

  Tabs.fromJson(dynamic json) {
    _title = json["title"];
    _route = json["route"];
    _display = json["display"];
    _sort = json["sort"];
    _icon = json["icon"];
    _mes = json["mes"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["title"] = _title;
    map["route"] = _route;
    map["display"] = _display;
    map["sort"] = _sort;
    map["icon"] = _icon;
    map["mes"] = _mes;
    return map;
  }

}