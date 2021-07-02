class BannerModel {
  String _updatedAt;
  int _bannersLen;
  List<Banners> _banners;

  String get updatedAt => _updatedAt;
  int get bannersLen => _bannersLen;
  List<Banners> get banners => _banners;

  BannerModel({
      String updatedAt, 
      int bannersLen, 
      List<Banners> banners}){
    _updatedAt = updatedAt;
    _bannersLen = bannersLen;
    _banners = banners;
}

  BannerModel.fromJson(dynamic json) {
    _updatedAt = json["updated_at"];
    _bannersLen = json["banners_len"];
    if (json["banners"] != null) {
      _banners = [];
      json["banners"].forEach((v) {
        _banners.add(Banners.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["updated_at"] = _updatedAt;
    map["banners_len"] = _bannersLen;
    if (_banners != null) {
      map["banners"] = _banners.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class Banners {
  String _title;
  String _desc;
  String _url;
  String _jumpAddress;
  int _order;

  int get order => _order;
  String get jumpAddress => _jumpAddress;
  String get title => _title;
  String get desc => _desc;
  String get url => _url;

  Banners({
    int order,
    String jumpAddress,
    String title,
    String desc,
    String url}){
    _jumpAddress = jumpAddress;
    _order = order;
    _title = title;
    _desc = desc;
    _url = url;
  }

  Banners.fromJson(dynamic json) {
    _jumpAddress = json['jump_address'];
    _order = json["order"];
    _title = json["title"];
    _desc = json["desc"];
    _url = json["url"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["jump_address"] = _jumpAddress;
    map["order"] = _order;
    map["title"] = _title;
    map["desc"] = _desc;
    map["url"] = _url;
    return map;
  }
}

class BannerRequestModel {
  String _classify;

  String get classify => _classify;

  BannerRequestModel({
    String classify}){
    _classify = classify;
  }

  BannerRequestModel.fromJson(dynamic json) {
    _classify = json["classify"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["classify"] = _classify;
    return map;
  }

}