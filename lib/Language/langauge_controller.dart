import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app_const_language.dart';
import 'language_model.dart';

class LocalizationController extends GetxController implements GetxService {
  late final SharedPreferences sharedPreferences;

  LocalizationController({required this.sharedPreferences}) {
    loadCurrentLanguage();
  }

  Locale _locale = Locale(AppConstants.languages[0].languageCode,
      AppConstants.languages[0].countryCode);
  Locale get locale => _locale;
  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

  List<LanguageModel> _languages = [];

  List<LanguageModel> get languages => _languages;

  void loadCurrentLanguage() async {
    _locale = Locale(
        sharedPreferences.getString(AppConstants.LANGUAGE_CODE) ??
            AppConstants.languages[0].languageCode,
        sharedPreferences.getString(AppConstants.COUNTRY_CODE) ??
            AppConstants.languages[0].countryCode);

    for (int index = 0; index < AppConstants.languages.length; index++) {
      if (AppConstants.languages[index].languageCode == _locale.languageCode) {
        _selectedIndex = index;
        break;
      }
    }
    _languages = [];
    _languages.addAll(AppConstants.languages);
    update();
  }

  void setLanguage(Locale locale) {
    Get.updateLocale(locale);
    _locale = locale;
    saveLanguage(_locale);
    update();
  }

  void setSelectIndex(int index) {
    _selectedIndex = index;
    update();
  }

  void saveLanguage(Locale locale) async {
    sharedPreferences.setString(
        AppConstants.LANGUAGE_CODE, locale.languageCode);
    sharedPreferences.setString(AppConstants.COUNTRY_CODE, locale.countryCode!);
  }
}
