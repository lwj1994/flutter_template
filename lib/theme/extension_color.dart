import 'package:flutter/material.dart';
import 'package:lu_foundation/foundation.dart';

/// @author luwenjie on 2024/2/18 22:28:50
///
///
class AppThemeColor extends ThemeExtension<AppThemeColor> {
  // icon
  final Color iconPrimary;
  final Color iconThird;
  final Color iconSecondary;
  final Color iconUnselected;

  // text
  final Color textPrimary;
  final Color textSecondary;
  final Color textThird;
  final Color textDisable;

  // bg
  final Color bgPrimary;
  final Color bgSecondary;
  final Color bgThird;
  final Color bgFourth;

  final Color success;
  final Color error;
  final Color warning;

  final Color buttonPrimary;
  final Color buttonSecondary;

  final Color borderPrimary;
  final Color borderSecondary;
  final Color borderThird;

  final Color colorPrimary;
  final Color colorSecondary;
  final Color colorThird;

  factory AppThemeColor.light() => AppThemeColor();

  factory AppThemeColor.dark() {
    final light = AppThemeColor.light();
    return AppThemeColor(
      bgPrimary: const Color(0xFFE4E2F2),
      bgSecondary: const Color.fromARGB(255, 28, 28, 30),
      bgThird: const Color.fromARGB(255, 44, 44, 46),
      bgFourth: const Color.fromARGB(255, 58, 58, 60),
      borderSecondary: LuColorUtil.inverseColor(light.borderSecondary),
      borderPrimary: LuColorUtil.inverseColor(light.borderPrimary),
      borderThird: LuColorUtil.inverseColor(light.borderThird),
      iconThird: LuColorUtil.inverseColor(light.iconThird),
      iconPrimary: LuColorUtil.inverseColor(light.iconPrimary),
      iconSecondary: LuColorUtil.inverseColor(light.iconSecondary),
      iconUnselected: LuColorUtil.inverseColor(light.iconSecondary),
      textPrimary: const Color(0xE6FFFFFF),
      textSecondary: LuColorUtil.inverseColor(light.textSecondary),
      textThird: LuColorUtil.inverseColor(light.textThird),
      textDisable: LuColorUtil.inverseColor(light.textDisable),
      colorPrimary: const Color(0xFF7247DC),
      colorSecondary: const Color(0xFF0D002D),
      colorThird: const Color(0xFF7247DC),
      buttonSecondary: const Color(0xFFE4E2F2),
    );
  }

  AppThemeColor({
    this.iconPrimary = const Color(0xff2b263b),
    this.bgPrimary = const Color(0x0D7247DC),
    this.bgSecondary = const Color(0xFFFFFFFF),
    this.bgThird = const Color(0xFFFFFFFF),
    // #000000 10%
    this.bgFourth = const Color(0xFFF8F8F8),
    this.iconThird = const Color(0x80000000),
    this.iconSecondary = const Color(0xb3000000),
    this.iconUnselected = const Color(0x4d000000),
    this.error = const Color(0xffD94A4E),
    this.textDisable = const Color(0x4D000000),
    this.textThird = const Color(0x80000000),
    this.textPrimary = const Color(0xFF000000),
    this.textSecondary = const Color(0xb3000000),
    this.success = const Color(0xFF379E45),
    this.warning = const Color(0xFFFC7E22),
    this.buttonPrimary = const Color(0xFF7247DC),
    this.buttonSecondary = const Color(0x332B1AC0),
    this.borderPrimary = const Color(0x4d000000),
    this.borderSecondary = const Color(0x1A000000),
    this.borderThird = const Color(0x0d000000),
    this.colorPrimary = const Color(0xFF7247DC),
    this.colorSecondary = const Color(0xFF0D002D),
    this.colorThird = const Color(0xFF7247DC),
  });

  @override
  ThemeExtension<AppThemeColor> copyWith() {
    return this;
  }

  @override
  ThemeExtension<AppThemeColor> lerp(
      covariant ThemeExtension<AppThemeColor>? other, double t) {
    if (other! is AppThemeColor) {
      return this;
    }
    other = other as AppThemeColor;
    return AppThemeColor(
      iconPrimary: Color.lerp(iconPrimary, other.iconPrimary, t) ?? iconPrimary,
      iconSecondary:
          Color.lerp(iconSecondary, other.iconSecondary, t) ?? iconSecondary,
      bgPrimary: Color.lerp(bgPrimary, other.bgPrimary, t) ?? bgPrimary,
      iconThird: Color.lerp(iconThird, other.iconThird, t) ?? iconThird,
      error: Color.lerp(error, other.error, t) ?? error,
      textDisable: Color.lerp(textDisable, other.textDisable, t) ?? textDisable,
      textThird: Color.lerp(textThird, other.textThird, t) ?? textThird,
      textPrimary: Color.lerp(textPrimary, other.textPrimary, t) ?? textPrimary,
      textSecondary:
          Color.lerp(textSecondary, other.textSecondary, t) ?? textSecondary,
      bgSecondary: Color.lerp(bgSecondary, other.bgSecondary, t) ?? bgSecondary,
      bgThird: Color.lerp(bgThird, other.bgThird, t) ?? bgThird,
      success: Color.lerp(success, other.success, t) ?? success,
      warning: Color.lerp(warning, other.warning, t) ?? warning,
      buttonPrimary:
          Color.lerp(buttonPrimary, other.buttonPrimary, t) ?? buttonPrimary,
      borderSecondary: Color.lerp(borderSecondary, other.borderSecondary, t) ??
          borderSecondary,
      borderPrimary:
          Color.lerp(borderPrimary, other.borderPrimary, t) ?? borderPrimary,
      borderThird: Color.lerp(borderThird, other.borderThird, t) ?? borderThird,
      colorThird: Color.lerp(colorThird, other.colorThird, t) ?? colorThird,
      colorPrimary:
          Color.lerp(colorPrimary, other.colorPrimary, t) ?? colorPrimary,
    );
  }
}

extension ColorExtension on BuildContext {
  AppThemeColor get extensionAppThemeColor =>
      Theme.of(this).extension<AppThemeColor>()!;

  ColorScheme get mdColorScheme => Theme.of(this).colorScheme;

  ThemeData get theme => Theme.of(this);
}
