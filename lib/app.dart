import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lu_foundation/foundation.dart';

import 'routes/app_router.dart';

/// @author luwenjie on 2023/9/14 22:52:57
///

class Application extends LuPage {
  const Application({super.key});

  static void kill() {
    exit(0);
  }

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AppPageState();
}

class _AppPageState extends LuPageState<Application> {
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
    // congThemeUtil.listen((CongThemeMode mode) {
    //   setState(() {});
    // });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerDelegate: appRouter.delegate(navigatorObservers: () {
        return <NavigatorObserver>[AppRouterObserver()];
      }),
      title: "app",
      routeInformationParser: appRouter.defaultRouteParser(),
      showPerformanceOverlay: false,
      // locale: const Locale('zh', 'CH'),
      // localizationsDelegates: const [
      //   GlobalMaterialLocalizations.delegate,
      //   GlobalWidgetsLocalizations.delegate,
      // ],
      // supportedLocales: const [
      //   Locale('zh', 'CH'),
      //   Locale('en', 'US'),
      // ]
    );
    // theme: themeLight,
    // darkTheme: themeDark,
    // themeMode: congThemeUtil.theme.mode,
    // themeMode: ThemeMode.light,
  }
}
