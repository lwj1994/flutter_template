import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shoubox/base/page/base_page.dart';

import 'routes/app_router.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  const riverpodScope = ProviderScope(
    child: Application(),
  );
  runApp(riverpodScope);
}

class Application extends BasePage {
  const Application({super.key});

  static void kill() {
    exit(0);
  }

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AppPageState();
}

class _AppPageState extends BasePageState<Application> {
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
    congThemeUtil.listen((CongThemeMode mode) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    final child = MaterialApp.router(
      routerDelegate: appRouter.delegate(navigatorObservers: () {
        return [AppRouterObserver()];
      }),
      title: "临界",
      routeInformationParser: appRouter.defaultRouteParser(),
      showPerformanceOverlay: false,
      locale: const Locale('zh', 'CH'),
      // localizationsDelegates: const [
      //   GlobalMaterialLocalizations.delegate,
      //   GlobalWidgetsLocalizations.delegate,
      // ],
      supportedLocales: const [
        Locale('zh', 'CH'),
        Locale('en', 'US'),
      ],
      theme: themeLight,
      darkTheme: themeDark,
      themeMode: congThemeUtil.theme.mode,
      // themeMode: ThemeMode.light,
      builder: EasyLoading.init(builder: (BuildContext context, Widget? child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
          child: child ?? kEmptyWidget,
        );
      }),
    );
    return appEnv.isWeb
        ? Center(
            child: SizedBox(
              width: 400,
              child: child,
            ),
          )
        : child;
  }
}
