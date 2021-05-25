/// background_picture : "prospero://chssksqea.cr/bjydyu"
/// splash_type : -736026156059136
/// splash_screen_time : 3
/// jump_link : "nntp://mrsjw.nr/rqj"
/// updated_at : "1989-07-17 15:23:17"

class StartPageModel {
  String _backgroundPicture;
  int _splashType;
  int _splashScreenTime;
  String _jumpLink;
  String _updatedAt;

  String get backgroundPicture => _backgroundPicture;
  int get splashType => _splashType;
  int get splashScreenTime => _splashScreenTime;
  String get jumpLink => _jumpLink;
  String get updatedAt => _updatedAt;

  StartPageModel({
      String backgroundPicture, 
      int splashType, 
      int splashScreenTime, 
      String jumpLink, 
      String updatedAt}){
    _backgroundPicture = backgroundPicture;
    _splashType = splashType;
    _splashScreenTime = splashScreenTime;
    _jumpLink = jumpLink;
    _updatedAt = updatedAt;
}

  StartPageModel.fromJson(dynamic json) {
    _backgroundPicture = json["background_picture"];
    _splashType = json["splash_type"];
    _splashScreenTime = json["splash_screen_time"];
    _jumpLink = json["jump_link"];
    _updatedAt = json["updated_at"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["background_picture"] = _backgroundPicture;
    map["splash_type"] = _splashType;
    map["splash_screen_time"] = _splashScreenTime;
    map["jump_link"] = _jumpLink;
    map["updated_at"] = _updatedAt;
    return map;
  }

}