// ignore_for_file: non_constant_identifier_names
// ignore_for_file: camel_case_types
// ignore_for_file: prefer_single_quotes

// This file is automatically generated. DO NOT EDIT, all your changes would be lost.
import 'package:QiYang/model/response/bottom_navigation_response_model.dart';
import 'package:QiYang/generated/json/bottom_navigation_response_model_helper.dart';
import 'package:QiYang/model/response/token_response_model.dart';
import 'package:QiYang/generated/json/token_response_model_helper.dart';
import 'package:QiYang/model/response/article_classify_response_model.dart';
import 'package:QiYang/generated/json/article_classify_response_model_helper.dart';
import 'package:QiYang/model/response/start_page_response_model.dart';
import 'package:QiYang/generated/json/start_page_response_model_helper.dart';
import 'package:QiYang/model/response/banner_response_model.dart';
import 'package:QiYang/generated/json/banner_response_model_helper.dart';
import 'package:QiYang/model/response/user_info_response_model.dart';
import 'package:QiYang/generated/json/user_info_response_model_helper.dart';
import 'package:QiYang/model/response/guide_page_response_model.dart';
import 'package:QiYang/generated/json/guide_page_response_model_helper.dart';

class JsonConvert<T> {
	T fromJson(Map<String, dynamic> json) {
		return _getFromJson<T>(runtimeType, this, json);
	}

  Map<String, dynamic> toJson() {
		return _getToJson<T>(runtimeType, this);
  }

  static _getFromJson<T>(Type type, data, json) {
		switch (type) {
			case BottomNavigationResponseModel:
				return bottomNavigationResponseModelFromJson(data as BottomNavigationResponseModel, json) as T;
			case BottomNavigationResponseTabs:
				return bottomNavigationResponseTabsFromJson(data as BottomNavigationResponseTabs, json) as T;
			case TokenResponseModel:
				return tokenResponseModelFromJson(data as TokenResponseModel, json) as T;
			case ArticleClassifyResponseModel:
				return articleClassifyResponseModelFromJson(data as ArticleClassifyResponseModel, json) as T;
			case ArticleClassifyResponseData:
				return articleClassifyResponseDataFromJson(data as ArticleClassifyResponseData, json) as T;
			case StartPageResponseModel:
				return startPageResponseModelFromJson(data as StartPageResponseModel, json) as T;
			case BannerResponseModel:
				return bannerResponseModelFromJson(data as BannerResponseModel, json) as T;
			case BannerResponseBanners:
				return bannerResponseBannersFromJson(data as BannerResponseBanners, json) as T;
			case UserInfoResponseModel:
				return userInfoResponseModelFromJson(data as UserInfoResponseModel, json) as T;
			case GuidePageResponseModel:
				return guidePageResponseModelFromJson(data as GuidePageResponseModel, json) as T;
			case GuidePageResponseImages:
				return guidePageResponseImagesFromJson(data as GuidePageResponseImages, json) as T;    }
		return data as T;
	}

  static _getToJson<T>(Type type, data) {
		switch (type) {
			case BottomNavigationResponseModel:
				return bottomNavigationResponseModelToJson(data as BottomNavigationResponseModel);
			case BottomNavigationResponseTabs:
				return bottomNavigationResponseTabsToJson(data as BottomNavigationResponseTabs);
			case TokenResponseModel:
				return tokenResponseModelToJson(data as TokenResponseModel);
			case ArticleClassifyResponseModel:
				return articleClassifyResponseModelToJson(data as ArticleClassifyResponseModel);
			case ArticleClassifyResponseData:
				return articleClassifyResponseDataToJson(data as ArticleClassifyResponseData);
			case StartPageResponseModel:
				return startPageResponseModelToJson(data as StartPageResponseModel);
			case BannerResponseModel:
				return bannerResponseModelToJson(data as BannerResponseModel);
			case BannerResponseBanners:
				return bannerResponseBannersToJson(data as BannerResponseBanners);
			case UserInfoResponseModel:
				return userInfoResponseModelToJson(data as UserInfoResponseModel);
			case GuidePageResponseModel:
				return guidePageResponseModelToJson(data as GuidePageResponseModel);
			case GuidePageResponseImages:
				return guidePageResponseImagesToJson(data as GuidePageResponseImages);
			}
			return data as T;
		}
  //Go back to a single instance by type
	static _fromJsonSingle<M>( json) {
		String type = M.toString();
		if(type == (BottomNavigationResponseModel).toString()){
			return BottomNavigationResponseModel().fromJson(json);
		}
		if(type == (BottomNavigationResponseTabs).toString()){
			return BottomNavigationResponseTabs().fromJson(json);
		}
		if(type == (TokenResponseModel).toString()){
			return TokenResponseModel().fromJson(json);
		}
		if(type == (ArticleClassifyResponseModel).toString()){
			return ArticleClassifyResponseModel().fromJson(json);
		}
		if(type == (ArticleClassifyResponseData).toString()){
			return ArticleClassifyResponseData().fromJson(json);
		}
		if(type == (StartPageResponseModel).toString()){
			return StartPageResponseModel().fromJson(json);
		}
		if(type == (BannerResponseModel).toString()){
			return BannerResponseModel().fromJson(json);
		}
		if(type == (BannerResponseBanners).toString()){
			return BannerResponseBanners().fromJson(json);
		}
		if(type == (UserInfoResponseModel).toString()){
			return UserInfoResponseModel().fromJson(json);
		}
		if(type == (GuidePageResponseModel).toString()){
			return GuidePageResponseModel().fromJson(json);
		}
		if(type == (GuidePageResponseImages).toString()){
			return GuidePageResponseImages().fromJson(json);
		}

		return null;
	}

  //list is returned by type
	static M _getListChildType<M>(List data) {
		if(<BottomNavigationResponseModel>[] is M){
			return data.map<BottomNavigationResponseModel>((e) => BottomNavigationResponseModel().fromJson(e)).toList() as M;
		}
		if(<BottomNavigationResponseTabs>[] is M){
			return data.map<BottomNavigationResponseTabs>((e) => BottomNavigationResponseTabs().fromJson(e)).toList() as M;
		}
		if(<TokenResponseModel>[] is M){
			return data.map<TokenResponseModel>((e) => TokenResponseModel().fromJson(e)).toList() as M;
		}
		if(<ArticleClassifyResponseModel>[] is M){
			return data.map<ArticleClassifyResponseModel>((e) => ArticleClassifyResponseModel().fromJson(e)).toList() as M;
		}
		if(<ArticleClassifyResponseData>[] is M){
			return data.map<ArticleClassifyResponseData>((e) => ArticleClassifyResponseData().fromJson(e)).toList() as M;
		}
		if(<StartPageResponseModel>[] is M){
			return data.map<StartPageResponseModel>((e) => StartPageResponseModel().fromJson(e)).toList() as M;
		}
		if(<BannerResponseModel>[] is M){
			return data.map<BannerResponseModel>((e) => BannerResponseModel().fromJson(e)).toList() as M;
		}
		if(<BannerResponseBanners>[] is M){
			return data.map<BannerResponseBanners>((e) => BannerResponseBanners().fromJson(e)).toList() as M;
		}
		if(<UserInfoResponseModel>[] is M){
			return data.map<UserInfoResponseModel>((e) => UserInfoResponseModel().fromJson(e)).toList() as M;
		}
		if(<GuidePageResponseModel>[] is M){
			return data.map<GuidePageResponseModel>((e) => GuidePageResponseModel().fromJson(e)).toList() as M;
		}
		if(<GuidePageResponseImages>[] is M){
			return data.map<GuidePageResponseImages>((e) => GuidePageResponseImages().fromJson(e)).toList() as M;
		}

		throw Exception("not found");
	}

  static M fromJsonAsT<M>(json) {
		if (json is List) {
			return _getListChildType<M>(json);
		} else {
			return _fromJsonSingle<M>(json) as M;
		}
	}
}