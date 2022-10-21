import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class l10n {
  static AppLocalizations get tr {
    return AppLocalizations.of(Get.context!)!;
  }

  static List<LocalizationsDelegate<dynamic>> localizationsDelegates() =>
      AppLocalizations.localizationsDelegates;

  static List<Locale> supportedLocales() => AppLocalizations.supportedLocales;
}
