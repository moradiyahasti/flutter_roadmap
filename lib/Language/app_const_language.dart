
// ignore_for_file: constant_identifier_names

import 'language_model.dart';

class AppConstants{

  //language
  static const String COUNTRY_CODE = "country_code";
  static const String LANGUAGE_CODE = "language_code";

  static List<LanguageModel> languages = [
    LanguageModel(languageName: "English", countryCode: "US", languageCode: "en"),
    LanguageModel(languageName: "हिंदी", countryCode: "IN", languageCode: "hi"),
  ];

}