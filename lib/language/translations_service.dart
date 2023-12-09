import 'dart:collection';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:multi_language/language/value/en.dart';
import 'package:multi_language/language/value/hi.dart';

class TranslationService extends Translations {
  static Locale? get locale => fallbackLocale;
  static final fallbackLocale = const Locale('en', 'US');

  static final langCodes = ['en', 'hi'];

  static final locales = [
    const Locale('en', 'US'),
    const Locale('hi', 'VN'),
  ];

  static final langs =
  LinkedHashMap.from({'en': 'English', 'hi': 'Tiếng Việt'});

  static void changeLocale(String langCode) {
    final locale = _getLocaleFromLanguage(langCode: langCode);
    Get.updateLocale(locale);
  }

  @override
  Map<String, Map<String, String>> get keys => {
    'en_US': en,
    'vi_VN': hi,
  };

  static Locale _getLocaleFromLanguage({String? langCode}) {
    var lang = langCode ?? Get.deviceLocale?.languageCode;
    for (int i = 0; i < langCodes.length; i++) {
      if (lang == langCodes[i]) return locales[i];
    }
    return Get.locale!;
  }
}