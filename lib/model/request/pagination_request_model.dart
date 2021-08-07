/// page : 1
/// limit : 1

class PaginationRequestModel {
  int _page;
  int _limit;

  int get page => _page;
  int get limit => _limit;

  PaginationRequestModel({
      int page, 
      int limit}){
    _page = page;
    _limit = limit;
}

  PaginationRequestModel.fromJson(dynamic json) {
    _page = json["page"];
    _limit = json["limit"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["page"] = _page;
    map["limit"] = _limit;
    return map;
  }

}