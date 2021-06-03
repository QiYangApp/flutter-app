/// jump_page : ""
/// images : [{"title":"WhoNS","url":"tn3270://lyolj.jp/fxvil","description":"7GcX","order":null},{"title":"h!krH","url":"news://prkwappbnv.do/bdgsbesm","description":"M9)FXPJ","order":null}]
/// updated_at : "2020-05-28 20:00:00"

class GuidePageModel {
  String _jumpPage;
  List<Images> _images;
  String _updatedAt;

  String get jumpPage => _jumpPage;
  List<Images> get images => _images;
  String get updatedAt => _updatedAt;

  GuidePageModel({
      String jumpPage, 
      List<Images> images, 
      String updatedAt}){
    _jumpPage = jumpPage;
    _images = images;
    _updatedAt = updatedAt;
}

  GuidePageModel.fromJson(dynamic json) {
    _jumpPage = json["jump_page"];
    if (json["images"] != null) {
      _images = [];
      json["images"].forEach((v) {
        _images.add(Images.fromJson(v));
      });
    }
    _updatedAt = json["updated_at"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["jump_page"] = _jumpPage;
    if (_images != null) {
      map["images"] = _images.map((v) => v.toJson()).toList();
    }
    map["updated_at"] = _updatedAt;
    return map;
  }

}

/// title : "WhoNS"
/// url : "tn3270://lyolj.jp/fxvil"
/// description : "7GcX"
/// order : null

class Images {
  String _title;
  String _url;
  String _description;
  dynamic _order;

  String get title => _title;
  String get url => _url;
  String get description => _description;
  dynamic get order => _order;

  Images({
      String title, 
      String url, 
      String description, 
      dynamic order}){
    _title = title;
    _url = url;
    _description = description;
    _order = order;
}

  Images.fromJson(dynamic json) {
    _title = json["title"];
    _url = json["url"];
    _description = json["description"];
    _order = json["order"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["title"] = _title;
    map["url"] = _url;
    map["description"] = _description;
    map["order"] = _order;
    return map;
  }

}