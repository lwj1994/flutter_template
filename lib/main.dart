import 'package:easy_localization/easy_localization.dart';
import 'package:easy_localization_loader/easy_localization_loader.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app.dart';
import 'feature/in18/i18n.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _initLocalization();
  const ProviderScope riverpodScope = ProviderScope(
    child: Application(),
  );
  runApp(EasyLocalization(
      supportedLocales: I18n.supportedLocales,
      path: "assets/in18/langs.csv",
      assetLoader: CsvAssetLoader(),
      fallbackLocale: const Locale('en', "US"),
      child: riverpodScope));
}

Future<void> _initLocalization() async {
  await EasyLocalization.ensureInitialized();
  final Locale locale = PlatformDispatcher.instance.locale;
  final String languageCode = locale.languageCode;
  final String? countryCode = locale.countryCode;
  final String? scriptCode = locale.scriptCode;
  debugPrint("languageCode  = $languageCode");
  debugPrint("countryCode  = $countryCode");
  debugPrint("scriptCode  = $scriptCode");
}
