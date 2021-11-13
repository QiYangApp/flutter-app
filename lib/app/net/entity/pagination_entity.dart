/// page : 1
/// page_size : 2

class PaginationEntity {
  PaginationEntity({
      int? page, 
      int? pageSize,}){
    _page = page;
    _pageSize = pageSize;
}

  PaginationEntity.fromJson(dynamic json) {
    _page = json['page'];
    _pageSize = json['page_size'];
  }
  int? _page;
  int? _pageSize;

  int? get page => _page;
  int? get pageSize => _pageSize;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['page'] = _page;
    map['page_size'] = _pageSize;
    return map;
  }

}