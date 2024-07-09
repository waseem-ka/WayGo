import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:waygo/constant/app_languages.dart';
import 'package:waygo/controllers/language_controller.dart';
import 'package:waygo/model/utiles/colors.dart';
import 'phone.dart';

enum Language {
  english,
  arabic,
}

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  Language selectedLanguage = Language.english;
  void selectLanguage(Language language) {
    setState(() {
      selectedLanguage = language;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
                child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  color: UltColor.blue,
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(150),
                      bottomRight: Radius.circular(150))),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(children: <Widget>[
                  SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                  Text(AppLocalizations.of(context)!.welcome,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontFamily: 'Quicksand',
                          fontWeight: FontWeight.bold)),
                  Container(
                    padding: const EdgeInsets.all(20),
                    child: SvgPicture.asset("assets/images/logo.svg"),
                  ),
                ]),
              ),
            )),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Directionality(
                      textDirection: TextDirection.ltr,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.4,
                            child: ElevatedButton(
                              onPressed: () {
                                Get.find<LanguageController>()
                                    .changeLocal(AppLanguages.english.code);
                                selectLanguage(Language.english);
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    selectedLanguage == Language.arabic
                                        ? Colors.white
                                        : UltColor.green,
                                textStyle: const TextStyle(fontSize: 23),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                side: BorderSide(
                                    color: UltColor.green, width: 0.5),
                                padding: const EdgeInsets.symmetric(
                                  vertical: 16.0,
                                ),
                              ),
                              child: Text(
                                AppLanguages.english.name,
                                style: TextStyle(
                                  fontSize: 28.0,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Quicksand',
                                  color: selectedLanguage == Language.arabic
                                      ? UltColor.green
                                      : Colors.white,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.4,
                            child: ElevatedButton(
                              onPressed: () {
                                Get.find<LanguageController>()
                                    .changeLocal(AppLanguages.arabic.code);
                                selectLanguage(Language.arabic);
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    selectedLanguage == Language.arabic
                                        ? UltColor.green
                                        : Colors.white,
                                textStyle: const TextStyle(
                                    fontSize: 23, fontFamily: 'Quicksand'),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                side: BorderSide(
                                    color: UltColor.green, width: 0.5),
                                padding: const EdgeInsets.symmetric(
                                  vertical: 16.0,
                                ),
                              ),
                              child: Text(
                                AppLanguages.arabic.name,
                                style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.normal,
                                  color: selectedLanguage == Language.arabic
                                      ? const Color(0xFFFFFFFF)
                                      : UltColor.green,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.075,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          textStyle: const TextStyle(fontSize: 23),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          side: BorderSide(color: UltColor.green, width: 0.5),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const phoneNumber()),
                          );
                        },
                        child: Text(
                          AppLocalizations.of(context)!.helloWorld,
                          style: TextStyle(color: UltColor.green, fontSize: 23),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.07,
            ),
          ],
        ),
      ),
    );
  }
}
