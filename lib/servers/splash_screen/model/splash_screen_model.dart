/// jump_link : "mid://ggobs.gn/xthpgkhodn"
/// background_picture : "http://qszn6xg2u.hn-bkt.clouddn.com/WechatIMG17.jpeg"

class SplashScreenModel {
  String _jumpLink;
  String _backgroundPicture;

  String get jumpLink => _jumpLink;
  String get backgroundPicture => _backgroundPicture;

  SplashScreenModel({
      String jumpLink, 
      String backgroundPicture}){
    _jumpLink = jumpLink;
    _backgroundPicture = backgroundPicture;
}

  SplashScreenModel.fromJson(dynamic json) {
    _jumpLink = json["jump_link"];
    _backgroundPicture = json["background_picture"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["jump_link"] = _jumpLink;
    map["background_picture"] = _backgroundPicture;
    return map;
  }

}