// ignore_for_file: camel_case_types, avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_const_language.dart';
import 'langauge_controller.dart';
import 'language_model.dart';

class Language_Home extends StatefulWidget {
  const Language_Home({super.key});

  @override
  State<Language_Home> createState() => _Language_HomeState();
}

class _Language_HomeState extends State<Language_Home> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LocalizationController>(
        builder: (localizationController) {
      return Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(children: [
            const SizedBox(
              height: 50,
            ),
            Text("Play Game".tr),
            const Divider(),
            Text("Today's Results".tr),
            const Divider(),
            Text("Refresh".tr),
            const Divider(),
            Text("Passbook".tr),
            const Divider(),
            Text("Withdraw Points".tr),
            const Divider(),
            Text("Watch our youtube video to get clarity about how game works."
                .tr),
            const Divider(),
            Text("Watch Youtube Video".tr),
            const Divider(),
            Text(
              " 24/7 Instant Withdrawals".tr,
            ),
            const Divider(),
            Text("Update Password".tr),
            const SizedBox(
              height: 20,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "App Language :".tr,
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        letterSpacing: 0.001),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Container(
                    width: 20,
                    height: 2,
                    color: Colors.blue,
                  )
                ],
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              height: 50,
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: localizationController.languages.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return LanguageWidget(
                      languageModel: localizationController.languages[index],
                      localizationController: localizationController,
                      index: index,
                    );
                  }),
            ),
          ]),
        ),
      );
    });
  }
}

class LanguageWidget extends StatelessWidget {
  final LanguageModel languageModel;
  final LocalizationController localizationController;
  final int index;

  const LanguageWidget({
    super.key,
    required this.languageModel,
    required this.localizationController,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("widget language : ${languageModel.languageCode}");
        localizationController.setLanguage(Locale(
            AppConstants.languages[index].languageCode,
            AppConstants.languages[index].countryCode));
        localizationController.setSelectIndex(index);
      },
      child: Container(
          height: 50,
          color: Colors.white,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 12),
                child: CircleAvatar(
                  radius: 10,
                  backgroundColor: Colors.pink,
                  child: CircleAvatar(
                      radius: 8,
                      backgroundColor: Colors.white,
                      child: localizationController.selectedIndex == index
                          ? const CircleAvatar(
                              radius: 5.5, backgroundColor: Colors.pink)
                          : Container()),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(languageModel.languageName),
            ],
          )),
    );
  }
}
