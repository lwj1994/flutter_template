import 'package:flutter/scheduler.dart';
import 'package:shoubox/data/app_kv.dart';
import 'package:shoubox/main.dart';

/// @author luwenjie on 2023/8/25 19:07:21

final appTheme = _Theme();

enum AppThemeMode {
  light(id: "light", mode: ThemeMode.light),
  dark(id: "dark", mode: ThemeMode.dark),
  system(id: "system", mode: ThemeMode.system);

  final String id;
  final ThemeMode mode;

  const AppThemeMode({required this.id, required this.mode});
}

class _Theme {
  final _notifier = ValueNotifier<AppThemeMode>(AppThemeMode.system);

  Function() listen(Function(AppThemeMode mode) onThemeChanged) {
    a() {
      onThemeChanged.call(_notifier.value);
    }

    _notifier.addListener(a);
    return () {
      _notifier.removeListener(a);
    };
  }

  AppThemeMode _mode = AppThemeMode.system;

  set theme(AppThemeMode value) {
    _notifier.value = value;
    _mode = value;
    // AppShareKeys.themeMode.string = value.id;
  }

  AppThemeMode get theme => _mode;

  Future<void> init() async {
    final s = AppShareKeys.themeMode.string;
    // 默认 system
    _mode = AppThemeMode.values.firstWhereOrNull((e) => e.id == s) ??
        AppThemeMode.system;
    SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(
      // Android
      statusBarColor: Colors.transparent,
      // Android 状态栏字体颜色
      statusBarIconBrightness: isLightMode ? Brightness.dark : Brightness.light,
      // iOS
      statusBarBrightness: isLightMode ? Brightness.light : Brightness.dark,
      // Android
      systemNavigationBarColor: isLightMode ? Colors.white : Colors.black,
      systemNavigationBarDividerColor: Colors.transparent,
      // Android
      systemNavigationBarIconBrightness:
          isLightMode ? Brightness.light : Brightness.dark,
    );
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }

  bool get isLightMode {
    switch (_mode.mode) {
      case ThemeMode.system:
        return SchedulerBinding
                .instance.platformDispatcher.platformBrightness ==
            Brightness.light;
      case ThemeMode.light:
        return true;
      case ThemeMode.dark:
        return false;
    }
  }
}
