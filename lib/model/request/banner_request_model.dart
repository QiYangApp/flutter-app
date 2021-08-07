/// classify : ""

// banner 类型
enum BannerClassify { home }

extension BannerClassifyextension on BannerClassify {
  String get desc {
    switch (this) {
      case BannerClassify.home:
        return 'home';
      default:
        return null;
    }
  }
}

class BannerRequestModel {
  String _classify;

  String get classify => _classify;

  BannerRequestModel({String classify}) {
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
