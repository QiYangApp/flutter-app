// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values

class S {
  S();
  
  static S current;
  
  static const AppLocalizationDelegate delegate =
    AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false) ? locale.languageCode : locale.toString();
    final localeName = Intl.canonicalizedLocale(name); 
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      S.current = S();
      
      return S.current;
    });
  } 

  static S of(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Qi Yang`
  String get appName {
    return Intl.message(
      'Qi Yang',
      name: 'appName',
      desc: '',
      args: [],
    );
  }

  /// `Light/Dark Mode`
  String get changeDarkMode {
    return Intl.message(
      'Light/Dark Mode',
      name: 'changeDarkMode',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get changeLanguage {
    return Intl.message(
      'Language',
      name: 'changeLanguage',
      desc: '',
      args: [],
    );
  }

  /// `Dark Mode`
  String get darkMode {
    return Intl.message(
      'Dark Mode',
      name: 'darkMode',
      desc: '',
      args: [],
    );
  }

  /// `Light Mode`
  String get lightMode {
    return Intl.message(
      'Light Mode',
      name: 'lightMode',
      desc: '',
      args: [],
    );
  }

  /// `Auto`
  String get automatic {
    return Intl.message(
      'Auto',
      name: 'automatic',
      desc: '',
      args: [],
    );
  }

  /// `jump over {seconds}`
  String startPage(Object seconds) {
    return Intl.message(
      'jump over $seconds',
      name: 'startPage',
      desc: '',
      args: [seconds],
    );
  }

  /// `login`
  String get nav_login {
    return Intl.message(
      'login',
      name: 'nav_login',
      desc: '',
      args: [],
    );
  }

  /// `Recommended items`
  String get recommendedItems {
    return Intl.message(
      'Recommended items',
      name: 'recommendedItems',
      desc: '',
      args: [],
    );
  }

  /// `More`
  String get more {
    return Intl.message(
      'More',
      name: 'more',
      desc: '',
      args: [],
    );
  }

  /// `Recommended Article`
  String get homeRecommendedArticle {
    return Intl.message(
      'Recommended Article',
      name: 'homeRecommendedArticle',
      desc: '',
      args: [],
    );
  }

  /// `QiYang`
  String get loginAppBarTitle {
    return Intl.message(
      'QiYang',
      name: 'loginAppBarTitle',
      desc: '',
      args: [],
    );
  }

  /// `nickname`
  String get loginNicknameInputTitle {
    return Intl.message(
      'nickname',
      name: 'loginNicknameInputTitle',
      desc: '',
      args: [],
    );
  }

  /// `password`
  String get loginPasswordInputTitle {
    return Intl.message(
      'password',
      name: 'loginPasswordInputTitle',
      desc: '',
      args: [],
    );
  }

  /// `login`
  String get loginBtnText {
    return Intl.message(
      'login',
      name: 'loginBtnText',
      desc: '',
      args: [],
    );
  }

  /// `logging`
  String get loginBtnLockText {
    return Intl.message(
      'logging',
      name: 'loginBtnLockText',
      desc: '',
      args: [],
    );
  }

  /// `home`
  String get home_header_title {
    return Intl.message(
      'home',
      name: 'home_header_title',
      desc: '',
      args: [],
    );
  }

  /// `agree with`
  String get home_item_agree_with {
    return Intl.message(
      'agree with',
      name: 'home_item_agree_with',
      desc: '',
      args: [],
    );
  }

  /// `see`
  String get home_item_see {
    return Intl.message(
      'see',
      name: 'home_item_see',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'zh', countryCode: 'CN'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    if (locale != null) {
      for (var supportedLocale in supportedLocales) {
        if (supportedLocale.languageCode == locale.languageCode) {
          return true;
        }
      }
    }
    return false;
  }
}