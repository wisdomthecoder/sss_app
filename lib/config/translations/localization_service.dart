import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sss_app/data/shared_pref.dart';

import 'ar_AR/ar_ar_translation.dart';
import 'en_US/en_us_translation.dart';

class LocalizationService extends Translations {
  // prevent creating instance
  LocalizationService._();

  static LocalizationService? _instance;

  static LocalizationService getInstance() {
    _instance ??= LocalizationService._();
    return _instance!;
  }

  // default language
  static Locale defaultLanguage = supportedLanguages['en']!;

  // supported languages
  static Map<String, Locale> supportedLanguages = {
    'en': const Locale('en', 'US'),
    'ar': const Locale('ar', 'AR'),
  };

  // supported languages fonts family (must be in assets & pubspec yaml) or you can use google fonts
  static Map<String, TextStyle> supportedLanguagesFontsFamilies = {
    'en': const TextStyle(fontFamily: 'Poppins'),
    'ar': const TextStyle(fontFamily: 'Cairo'),
  };

  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': enUs,
        'ar_AR': arAR,
      };

  /// check if the language is supported
  static isLanguageSupported(String languageCode) =>
      supportedLanguages.keys.contains(languageCode);

  /// update app language by code language for example (en,ar..etc)
  static updateLanguage(String languageCode) async {
    // check if the language is supported
    if (!isLanguageSupported(languageCode)) return;
    // update current language in shared pref
    // AppStorage.setCurrentLanguage(languageCode);
    await Get.updateLocale(supportedLanguages[languageCode]!);
  }

  /// check if the language is english
  // static bool isItEnglish() =>
  // AppStorage.getCurrentLocal().languageCode.toLowerCase().contains('en');

  /// get current locale
  // static Locale getCurrentLocal() => AppStorage.getCurrentLocal();
}
