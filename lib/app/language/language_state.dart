part of 'language_cubit.dart';

abstract class LanguageState extends Equatable {
  final Iterable<LocalizationsDelegate<dynamic>> localizationsDelegates = [
    S.delegate,
    // GlobalMaterialLocalizations.delegate,
    // GlobalCupertinoLocalizations.delegate,
    // GlobalWidgetsLocalizations.delegate,
    // GlobalMaterialLocalizations.delegate,
  ];

  final Iterable<Locale> supportedLocales = S.delegate.supportedLocales;

  @override
  List<Object> get props => [];
}

class LanguageInitial extends LanguageState {

}
