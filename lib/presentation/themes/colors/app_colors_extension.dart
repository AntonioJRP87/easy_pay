import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppColorsExtension extends ThemeExtension<AppColorsExtension> {
  AppColorsExtension({
    required this.primary,
    required this.onPrimary,
    required this.grayBlue,
    required this.neutral900,
    required this.neutral800,
    required this.neutral700,
    required this.neutral600,
    required this.neutral500,
    required this.neutral400,
    required this.neutral300,
    required this.neutral200,
    required this.neutral100,
    required this.neutral50,
    required this.neutral0,
    required this.semanticError,
  });

  final Color primary;
  final Color onPrimary;
  final Color grayBlue;

  final Color neutral900;
  final Color neutral800;
  final Color neutral700;
  final Color neutral600;
  final Color neutral500;
  final Color neutral400;
  final Color neutral300;
  final Color neutral200;
  final Color neutral100;
  final Color neutral50;
  final Color neutral0;

  final Color semanticError;

  factory AppColorsExtension.from(AppColors colors) {
    return AppColorsExtension(
      primary: colors.primary,
      onPrimary: colors.onPrimary,
      grayBlue: colors.grayBlue,
      neutral900: colors.neutral900,
      neutral800: colors.neutral800,
      neutral700: colors.neutral700,
      neutral600: colors.neutral600,
      neutral500: colors.neutral500,
      neutral400: colors.neutral400,
      neutral300: colors.neutral300,
      neutral200: colors.neutral200,
      neutral100: colors.neutral100,
      neutral50: colors.neutral50,
      neutral0: colors.neutral0,
      semanticError: colors.semanticError,
    );
  }

  @override
  AppColorsExtension copyWith({
    Color? primary,
    Color? onPrimary,
    Color? grayBlue,
    Color? neutral900,
    Color? neutral800,
    Color? neutral700,
    Color? neutral600,
    Color? neutral500,
    Color? neutral400,
    Color? neutral300,
    Color? neutral200,
    Color? neutral100,
    Color? neutral50,
    Color? neutral0,
    Color? semanticError,
  }) {
    return AppColorsExtension(
      primary: primary ?? this.primary,
      onPrimary: onPrimary ?? this.onPrimary,
      grayBlue: grayBlue ?? this.grayBlue,
      neutral900: neutral900 ?? this.neutral900,
      neutral800: neutral800 ?? this.neutral800,
      neutral700: neutral700 ?? this.neutral700,
      neutral600: neutral600 ?? this.neutral600,
      neutral500: neutral500 ?? this.neutral500,
      neutral400: neutral400 ?? this.neutral400,
      neutral300: neutral300 ?? this.neutral300,
      neutral200: neutral200 ?? this.neutral200,
      neutral100: neutral100 ?? this.neutral100,
      neutral50: neutral50 ?? this.neutral50,
      neutral0: neutral0 ?? this.neutral0,
      semanticError: semanticError ?? this.semanticError,
    );
  }

  @override
  AppColorsExtension lerp(ThemeExtension<AppColorsExtension>? other, double t) {
    if (other is! AppColorsExtension) return this;

    return AppColorsExtension(
      primary: Color.lerp(primary, other.primary, t) ?? primary,
      onPrimary: Color.lerp(onPrimary, other.onPrimary, t) ?? onPrimary,
      grayBlue: Color.lerp(grayBlue, other.grayBlue, t) ?? grayBlue,
      neutral900: Color.lerp(neutral900, other.neutral900, t) ?? neutral900,
      neutral800: Color.lerp(neutral800, other.neutral800, t) ?? neutral800,
      neutral700: Color.lerp(neutral700, other.neutral700, t) ?? neutral700,
      neutral600: Color.lerp(neutral600, other.neutral600, t) ?? neutral600,
      neutral500: Color.lerp(neutral500, other.neutral500, t) ?? neutral500,
      neutral400: Color.lerp(neutral400, other.neutral400, t) ?? neutral400,
      neutral300: Color.lerp(neutral300, other.neutral300, t) ?? neutral300,
      neutral200: Color.lerp(neutral200, other.neutral200, t) ?? neutral200,
      neutral100: Color.lerp(neutral100, other.neutral100, t) ?? neutral100,
      neutral50: Color.lerp(neutral50, other.neutral50, t) ?? neutral50,
      neutral0: Color.lerp(neutral0, other.neutral0, t) ?? neutral0,
      semanticError:
          Color.lerp(semanticError, other.semanticError, t) ?? semanticError,
    );
  }
}
