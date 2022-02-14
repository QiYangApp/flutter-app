import 'dart:convert';
/// refresh_token : ""

RefreshTokenRequest refreshTokenRequestFromJson(String str) => RefreshTokenRequest.fromJson(json.decode(str));
String refreshTokenRequestToJson(RefreshTokenRequest data) => json.encode(data.toJson());
class RefreshTokenRequest {
  RefreshTokenRequest({
      String? refreshToken,}){
    _refreshToken = refreshToken;
}

  RefreshTokenRequest.fromJson(dynamic json) {
    _refreshToken = json['refresh_token'];
  }
  String? _refreshToken;

  String? get refreshToken => _refreshToken;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['refresh_token'] = _refreshToken;
    return map;
  }

}