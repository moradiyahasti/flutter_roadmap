// ignore_for_file: prefer_collection_literals, no_leading_underscores_for_local_identifiers

import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app_const_language.dart';
import 'langauge_controller.dart';
import 'language_model.dart';

Future<Map<String, Map<String, String>>> init()async{
  final sharedPreference = await SharedPreferences.getInstance();
  Get.lazyPut(() => sharedPreference);

  Get.lazyPut(() => LocalizationController(sharedPreferences: Get.find()));

  //retriving localized data

  Map<String, Map<String, String>> _languages = Map();

  for(LanguageModel languageModel in AppConstants.languages){
    String jsonStringValues = await rootBundle.loadString('assets/language/${languageModel.languageCode}.json');
    Map<String, dynamic> _mappedJson = json.decode(jsonStringValues);
    Map<String, String> _json = Map();

    _mappedJson.forEach((key, value) {

      _json[key] = value.toString();
    });

    _languages['${languageModel.languageCode}_${languageModel.countryCode}'] = _json;
  }
  return _languages;
}