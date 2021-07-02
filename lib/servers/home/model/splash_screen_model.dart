import 'package:QiYang/servers/common/model/base_model.dart';

class SplashScreenModel extends BaseModel {
  String _title;
  String _content;
  String _jumpLink;
  String _backgroundPicture;
  int _splashType;
  int _splashScreenTime;

  String get title => _title;
  String get content => _content;
  String get jumpLink => _jumpLink;
  String get backgroundPicture => _backgroundPicture;
  int get splashType => _splashType;
  int get splashScreenTime => _splashScreenTime;

  SplashScreenModel({
      String title, 
      String content, 
      String jumpLink, 
      String backgroundPicture, 
      int splashType, 
      int splashScreenTime}){
    _title = title;
    _content = content;
    _jumpLink = jumpLink;
    _backgroundPicture = backgroundPicture;
    _splashType = splashType;
    _splashScreenTime = splashScreenTime;
}

  SplashScreenModel.fromJson(dynamic json) {
    _title = json["title"];
    _content = json["content"];
    _jumpLink = json["jump_link"];
    _backgroundPicture = json["background_picture"];
    _splashType = json["splash_type"];
    _splashScreenTime = json["splash_screen_time"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["title"] = _title;
    map["content"] = _content;
    map["jump_link"] = _jumpLink;
    map["background_picture"] = _backgroundPicture;
    map["splash_type"] = _splashType;
    map["splash_screen_time"] = _splashScreenTime;
    return map;
  }

}