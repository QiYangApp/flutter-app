/// title : "1"
/// content : ""
/// url : ""
/// version : ""

class AppVersionUpgradeModel {
  String _title;
  String _content;
  String _url;
  String _version;

  String get title => _title;
  String get content => _content;
  String get url => _url;
  String get version => _version;

  AppVersionUpgradeModel({
      String title, 
      String content, 
      String url, 
      String version}){
    _title = title;
    _content = content;
    _url = url;
    _version = version;
}

  AppVersionUpgradeModel.fromJson(dynamic json) {
    _title = json["title"];
    _content = json["content"];
    _url = json["url"];
    _version = json["version"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["title"] = _title;
    map["content"] = _content;
    map["url"] = _url;
    map["version"] = _version;
    return map;
  }

}