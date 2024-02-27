/// @author luwenjie on 2023/8/25 19:07:21

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:temple/data/key_value/app_kv.dart';

import 'extension_color.dart';
import 'text_style.dart';

/// @author luwenjie on 2023/8/25 19:07:21

enum AppThemeMode {
  light(id: "light", mode: ThemeMode.light),
  dark(id: "dark", mode: ThemeMode.dark),
  system(id: "system", mode: ThemeMode.system);

  final String id;
  final ThemeMode mode;

  const AppThemeMode({required this.id, required this.mode});
}

class ThemeManager {
  static ThemeManager? _instance;

  static ThemeManager get instance => _checkInstance();

  static ThemeManager _checkInstance() {
    _instance ??= ThemeManager._();
    return _instance!;
  }

  ThemeManager._();

  final ValueNotifier<AppThemeMode> _notifier =
      ValueNotifier<AppThemeMode>(AppThemeMode.system);

  SystemUiOverlayStyle get systemUiLightStyle =>
      SystemUiOverlayStyle.dark.copyWith(
          statusBarColor: Colors.transparent,
          systemNavigationBarColor: Colors.white70);

  SystemUiOverlayStyle get systemUiDarkStyle =>
      SystemUiOverlayStyle.light.copyWith(
          statusBarColor: Colors.transparent,
          systemNavigationBarColor: Colors.black);

  ThemeData get lightThemeData => ThemeData.light().copyWith(
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.white.withOpacity(0.9),
        titleTextStyle: AppTextStyle.h4(),
        toolbarTextStyle: AppTextStyle.b4(),
        iconTheme: IconThemeData(
          color: Colors.black.withOpacity(0.8),
        ),
        elevation: 0,
      ),
      inputDecorationTheme: _M3Theme.lightInputDecorationTheme,
      cardTheme: _M3Theme.lightCard,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Colors.white.withOpacity(0.9),
      ),
      bottomSheetTheme: _M3Theme.bottomSheet,
      extensions: [AppThemeColor.light()],
      colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF6750A4)));

  ThemeData get darkThemeData => ThemeData.dark().copyWith(
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.black.withOpacity(0.9),
          titleTextStyle: AppTextStyle.h4(color: Colors.white.withOpacity(0.9)),
          toolbarTextStyle:
              AppTextStyle.b4(color: Colors.white.withOpacity(0.9)),
          iconTheme: IconThemeData(
            color: Colors.white.withOpacity(0.8),
          ),
          elevation: 0,
        ),
        cardTheme: _M3Theme.darkCard,
        inputDecorationTheme: _M3Theme.darkInputDecorationTheme,
        bottomSheetTheme: _M3Theme.bottomSheet,
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Colors.black.withOpacity(0.9),
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.yellow),
        extensions: [AppThemeColor.dark()],
      );

  SystemUiOverlayStyle get adaptiveSystemUiDarkStyle =>
      isLightMode ? systemUiLightStyle : systemUiDarkStyle;

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
    AppShareKeys.themeMode.string = value.id;
  }

  AppThemeMode get theme => _mode;

  Future<void> initialize() async {
    final String s = AppShareKeys.themeMode.string;
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

class _M3Theme {
  static final lightCard = CardTheme(
      surfaceTintColor: Colors.deepOrangeAccent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)));

  static final darkCard = CardTheme(
      color: Colors.black87,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)));

  static const bottomSheet = BottomSheetThemeData(
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10), topRight: Radius.circular(10))),
    clipBehavior: Clip.hardEdge,
    showDragHandle: true,
  );

  static const lightInputDecorationTheme = InputDecorationTheme(
      border: OutlineInputBorder(),
      contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      constraints: BoxConstraints(minHeight: 0));

  static const darkInputDecorationTheme = InputDecorationTheme(
      border: OutlineInputBorder(),
      contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      constraints: BoxConstraints(minHeight: 0));

  _M3Theme._();
}
