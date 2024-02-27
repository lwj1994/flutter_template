import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uizakura/uizakura.dart';

import 'route/app_router.dart';
import 'theme/theme.dart';

/// @author luwenjie on 2023/9/14 22:52:57
///

class Application extends UizakuraPage {
  const Application({super.key});

  static void kill() {
    exit(0);
  }

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AppPageState();
}

class _AppPageState extends UizakuraPageState<Application> {
  @override
  void initState() {
    super.initState();
    // app lifecycle
    AppLifecycleListener(
        onResume: () {
          debugPrint("app onResume");
        },
        onDetach: () {},
        onHide: () {
          debugPrint("app onHide");
        },
        onInactive: () {
          debugPrint("app onInactive");
        },
        onPause: () {
          debugPrint("app onPause");
        },
        onRestart: () {
          debugPrint("app onRestart");
        },
        onShow: () {
          debugPrint("app onShow");
        },
        onStateChange: (AppLifecycleState state) {
          debugPrint("app ${state.name}");
        });
    WidgetsBinding.instance.addObserver(this);
    ThemeManager.instance.listen((AppThemeMode mode) {
      setState(() {});
    });
    PlatformDispatcher.instance.onLocaleChanged = () {
      _initLocale();
    };
  }

  @override
  void didChangeLocales(List<Locale>? locales) {
    super.didChangeLocales(locales);
    _initLocale();
  }

  void _initLocale() {
    if (PlatformDispatcher.instance.locale.languageCode == "zh") {
      if (PlatformDispatcher.instance.locale.scriptCode?.toLowerCase() ==
          "hans") {
        context.setLocale(const Locale("zh", "CN"));
      }
      if (PlatformDispatcher.instance.locale.scriptCode?.toLowerCase() ==
          "hant") {
        context.setLocale(const Locale("zh", "TW"));
      }
    } else {
      context.setLocale(const Locale("en", "US"));
    }
  }

  @override
  Widget build(BuildContext context) {
    _initLocale();
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: ThemeManager.instance.adaptiveSystemUiDarkStyle,
      child: MaterialApp.router(
        routerDelegate: appRouter.delegate(navigatorObservers: () {
          return [AppRouterObserver()];
        }),
        title: "temple",
        routeInformationParser: appRouter.defaultRouteParser(),
        showPerformanceOverlay: false,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        themeMode: ThemeManager.instance.theme.mode,
        theme: ThemeManager.instance.lightThemeData,
        darkTheme: ThemeManager.instance.darkThemeData,
      ),
    );
  }
}
