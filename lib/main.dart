// ignore_for_file: prefer_const_constructors_in_immutables
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:network_connectivity/Language/deep.dart' as deep;
import 'package:network_connectivity/Sqlite_Database/sqlite_home_screen.dart';
import 'package:network_connectivity/provider/provider.dart';
import 'package:provider/provider.dart';
import 'Language/app_const_language.dart';
import 'Language/langauge_controller.dart';
import 'Language/message.dart';
import 'Video_Call/call_home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  Map<String, Map<String, String>> languages = await deep.init();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => FavoriteProvider()),
      ],
      child: MyApp(
        languages: languages,
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  MyApp({
    super.key,
    required this.languages,
  });

  final Map<String, Map<String, String>> languages;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LocalizationController>(
      builder: (localizationController) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'All Flutter Demo',
          theme: ThemeData(
            useMaterial3: true,
            colorSchemeSeed: const Color(0x9ff85243),
          ),
          locale: localizationController.locale,
          translations: Messages(languages: languages),
          fallbackLocale: Locale(
            AppConstants.languages[0].languageCode,
            AppConstants.languages[0].countryCode,
          ),
          home: HomePageCalling(),
        );
      },
    );
  }
}
