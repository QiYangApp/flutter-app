/// nickname : "账号"
/// password : "qewr"

class PasswdLoginRequestModel {
  String _nickname;
  String _password;

  String get nickname => _nickname;
  String get password => _password;

  PasswdLoginRequestModel({
      String nickname, 
      String password}){
    _nickname = nickname;
    _password = password;
}

  PasswdLoginRequestModel.fromJson(dynamic json) {
    _nickname = json["nickname"];
    _password = json["password"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["nickname"] = _nickname;
    map["password"] = _password;
    return map;
  }

}