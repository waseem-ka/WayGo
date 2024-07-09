import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LanguageController extends GetxController {
  Locale? _locale;

  Locale? get locale => _locale;

  void changeLocal(String languageCode) {
    _locale = Locale(languageCode);
    update();
  }
}
