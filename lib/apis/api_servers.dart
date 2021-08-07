import 'dart:convert';

import 'package:QiYang/apis/repository/ad_repository.dart';
import 'package:QiYang/apis/repository/article_classify_repository.dart';
import 'package:QiYang/apis/repository/auth_repository.dart';
import 'package:QiYang/apis/repository/navigation_repository.dart';
import 'package:QiYang/apis/repository/user_repository.dart';
import 'package:QiYang/model/request/banner_request_model.dart';
import 'package:QiYang/model/request/pagination_request_model.dart';
import 'package:QiYang/model/request/passwd_login_request_model.dart';
import 'package:QiYang/model/response/article_classify_response_model.dart';
import 'package:QiYang/model/response/banner_response_model.dart';
import 'package:QiYang/model/response/bottom_navigation_response_model.dart';
import 'package:QiYang/model/response/guide_page_response_model.dart';
import 'package:QiYang/model/response/start_page_response_model.dart';
import 'package:QiYang/model/response/token_response_model.dart';
import 'package:QiYang/model/response/user_info_response_model.dart';
import 'package:QiYang/util/crypto_util.dart';

class ApiServers {
  // static ApiServers _apiServers;
  //
  // // 单例公开访问点
  // factory ApiServers() =>_sharedInstance();
  //
  // // 静态私有成员，没有初始化
  // static ApiServers _instance = ApiServers._();
  //
  // // 私有构造函数
  // ApiServers._() {
  //   // 具体初始化代码
  //   _instance = ApiServers();
  // }
  //
  // // 静态、同步、私有访问点
  // static ApiServers _sharedInstance() {
  //   return _instance;
  // }

  // ----- ad -----//
  //获取启动页数据
  Future<StartPageResponseModel> startPage() {
    return AdRepository.startPage();
  }

  //获取引导页
  Future<GuidePageResponseModel> guidePage() {
    return AdRepository.guidePage();
  }

  //banner
  Future<BannerResponseModel> banner(BannerClassify classify) {
    return AdRepository.banner(BannerRequestModel(classify: classify.desc));
  }

  // ----- ad -----//

  //------ nav -------//

  //底部导航
  Future<BottomNavigationResponseModel> bottomNavigation() {
    return NavigationRepository.bottomNavigation();
  }

  //----- nav -----//

  //首页文档列表
  Future<ArticleClassifyResponseModel> hotHome({int page = 1, int limit = 10}) {
    return ArticleClassifyRepository.hotHome(
        PaginationRequestModel(page: page, limit: limit));
  }

  //---- nav -----//

  //----- auth -----//

  //密码登录
  Future<TokenResponseModel> passwdLogin(String nickname, String passwd) {
    return AuthRepository.passwdLogin(PasswdLoginRequestModel(
        password: CryptoUtil().passwd(passwd), nickname: nickname));
  }

  // ----- auth -----//

  // ------ user -----//

  Future<UserInfoResponseModel> userInfo() {
    return UserRepository().userInfo();
  }

  // ------ user -----//
}
