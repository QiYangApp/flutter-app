/// jump_page : ""
/// images : ["nntp://gsviwiygd.gd/eucwfvxxq","rlogin://bowv.ky/stwhvu","mid://mpfoj.om/hlbmgtg"]
/// updated_at : "2020-05-28 20:00:00"

class GuidePageModel {
  String _jumpPage;
  List<String> _images;
  String _updatedAt;

  String get jumpPage => _jumpPage;
  List<String> get images => _images;
  String get updatedAt => _updatedAt;

  GuidePageModel({
      String jumpPage, 
      List<String> images, 
      String updatedAt}){
    _jumpPage = jumpPage;
    _images = images;
    _updatedAt = updatedAt;
}

  GuidePageModel.fromJson(dynamic json) {
    _jumpPage = json["jump_page"];
    _images = json["images"] != null ? json["images"].cast<String>() : [];
    _updatedAt = json["updated_at"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["jump_page"] = _jumpPage;
    map["images"] = _images;
    map["updated_at"] = _updatedAt;
    return map;
  }

}