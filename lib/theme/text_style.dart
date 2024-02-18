import 'package:flutter/material.dart';

import 'theme.dart';

class AppTextStyle {
  static Color get _defaultTextColor => ThemeManager.instance.isLightMode
      ? Colors.black.withOpacity(0.9)
      : Colors.white.withOpacity(0.9);

  AppTextStyle._();

  static TextStyle h1({Color? color}) {
    return generateStyle(
      typography: CongTypography.h1,
      color: color ?? _defaultTextColor,
    );
  }

  static TextStyle h2({Color? color}) {
    return generateStyle(
      typography: CongTypography.h2,
      color: color ?? _defaultTextColor,
    );
  }

  static TextStyle h3({Color? color}) {
    return generateStyle(
      typography: CongTypography.h3,
      color: color ?? _defaultTextColor,
    );
  }

  static TextStyle h4({Color? color}) {
    return generateStyle(
      typography: CongTypography.h4,
      color: color ?? _defaultTextColor,
    );
  }

  static TextStyle h5({Color? color}) {
    return generateStyle(
      typography: CongTypography.h5,
      color: color ?? _defaultTextColor,
    );
  }

  static TextStyle h6({Color? color}) {
    return generateStyle(
      typography: CongTypography.h6,
      color: color ?? _defaultTextColor,
    );
  }

  static TextStyle h7({Color? color}) {
    return generateStyle(
      typography: CongTypography.h7,
      color: color ?? _defaultTextColor,
    );
  }

  static TextStyle h8({Color? color}) {
    return generateStyle(
      typography: CongTypography.h8,
      color: color ?? _defaultTextColor,
    );
  }

  static TextStyle b1({Color? color}) {
    return generateStyle(
      typography: CongTypography.b1,
      color: color ?? _defaultTextColor,
    );
  }

  static TextStyle b2({Color? color}) {
    return generateStyle(
      typography: CongTypography.b2,
      color: color ?? _defaultTextColor,
    );
  }

  static TextStyle generateStyle({
    required CongTypography typography,
    required Color color,
  }) {
    return typography.textStyle.copyWith(color: color ?? _defaultTextColor);
  }

  static TextStyle b3({Color? color}) {
    return generateStyle(
      typography: CongTypography.b3,
      color: color ?? _defaultTextColor,
    );
  }

  static TextStyle b4({Color? color}) {
    return generateStyle(
      typography: CongTypography.b4,
      color: color ?? _defaultTextColor,
    );
  }

  static TextStyle b5({Color? color}) {
    return generateStyle(
      typography: CongTypography.b5,
      color: color ?? _defaultTextColor,
    );
  }

  static TextStyle b6({Color? color}) {
    return generateStyle(
      typography: CongTypography.b6,
      color: color ?? _defaultTextColor,
    );
  }

  static TextStyle b7({Color? color}) {
    return generateStyle(
      typography: CongTypography.b7,
      color: color ?? _defaultTextColor,
    );
  }

  static TextStyle b8({Color? color}) {
    return generateStyle(
      typography: CongTypography.b8,
      color: color ?? _defaultTextColor,
    );
  }

  static TextStyle n1({Color? color}) {
    return generateStyle(
      typography: CongTypography.n1,
      color: color ?? _defaultTextColor,
    );
  }

  static TextStyle n2({Color? color}) {
    return generateStyle(
      typography: CongTypography.n2,
      color: color ?? _defaultTextColor,
    );
  }

  static TextStyle n3({Color? color}) {
    return generateStyle(
      typography: CongTypography.n3,
      color: color ?? _defaultTextColor,
    );
  }

  static TextStyle n4({Color? color}) {
    return generateStyle(
      typography: CongTypography.n4,
      color: color ?? _defaultTextColor,
    );
  }

  static TextStyle n5({Color? color}) {
    return generateStyle(
      typography: CongTypography.n5,
      color: color ?? _defaultTextColor,
    );
  }

  static TextStyle n6({Color? color}) {
    return generateStyle(
      typography: CongTypography.n6,
      color: color ?? _defaultTextColor,
    );
  }

  static TextStyle n7({Color? color}) {
    return generateStyle(
      typography: CongTypography.n7,
      color: color ?? _defaultTextColor,
    );
  }

  static TextStyle n8({Color? color}) {
    return generateStyle(
      typography: CongTypography.n8,
      color: color ?? _defaultTextColor,
    );
  }
}

enum CongTypography {
  h1,
  h2,
  h3,
  h4,
  h5,
  h6,
  h7,
  h8,
  b1,
  b2,
  b3,
  b4,
  b5,
  b6,
  b7,
  b8,
  n1,
  n2,
  n3,
  n4,
  n5,
  n6,
  n7,
  n8;

  String get fontFamily {
    switch (this) {
      case CongTypography.h1:
      case CongTypography.h2:
      case CongTypography.h3:
      case CongTypography.h4:
      case CongTypography.h5:
      case CongTypography.h6:
      case CongTypography.h7:
      case CongTypography.h8:
        return 'PingFang SC';

      case CongTypography.b1:
      case CongTypography.b2:
      case CongTypography.b3:
      case CongTypography.b4:
      case CongTypography.b5:
      case CongTypography.b6:
      case CongTypography.b7:
      case CongTypography.b8:
        return 'PingFang SC';

      case CongTypography.n1:
      case CongTypography.n2:
      case CongTypography.n3:
      case CongTypography.n4:
      case CongTypography.n5:
      case CongTypography.n6:
      case CongTypography.n7:
      case CongTypography.n8:
        return 'Roboto';
    }
  }

  FontWeight get fontWeight {
    switch (this) {
      case CongTypography.h1:
      case CongTypography.h2:
      case CongTypography.h3:
      case CongTypography.h4:
      case CongTypography.h5:
      case CongTypography.h6:
      case CongTypography.h7:
      case CongTypography.h8:
        return FontWeight.bold;

      case CongTypography.b1:
      case CongTypography.b2:
      case CongTypography.b3:
      case CongTypography.b4:
      case CongTypography.b5:
      case CongTypography.b6:
      case CongTypography.b7:
      case CongTypography.b8:
        return FontWeight.normal;

      case CongTypography.n1:
      case CongTypography.n2:
      case CongTypography.n3:
      case CongTypography.n4:
      case CongTypography.n5:
      case CongTypography.n6:
      case CongTypography.n7:
      case CongTypography.n8:
        return FontWeight.w800;
    }
  }

  double get fontSize {
    switch (this) {
      case h1:
      case b1:
      case n1:
        return 32;

      case h2:
      case b2:
      case n2:
        return 24;

      case h3:
      case b3:
      case n3:
        return 20;

      case h4:
      case b4:
      case n4:
        return 18;

      case h5:
      case b5:
      case n5:
        return 16;

      case h6:
      case b6:
      case n6:
        return 14;

      case h7:
      case b7:
      case n7:
        return 12;

      case h8:
      case b8:
      case n8:
        return 10;
    }
  }

  double get lineHeight {
    switch (this) {
      case h1:
      case b1:
      case n1:
        return 40;

      case h2:
      case b2:
      case n2:
        return 32;

      case h3:
      case b3:
      case n3:
        return 26;

      case h4:
      case b4:
      case n4:
        return 25;

      case h5:
      case b5:
      case n5:
        return 24;

      case h6:
      case b6:
      case n6:
        return 22;

      case h7:
      case b7:
      case n7:
        return 18;

      case h8:
      case b8:
      case n8:
        return 11;
    }
  }

  TextStyle get textStyle {
    return TextStyle(
      fontFamily: fontFamily == 'Roboto' ? fontFamily : null,
      fontWeight: fontWeight,
      fontSize: fontSize,
      leadingDistribution: TextLeadingDistribution.even,
    );
  }
}
