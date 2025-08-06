import 'package:easy_pay/presentation/themes/colors/app_colors.dart';
import 'package:easy_pay/presentation/themes/colors/app_colors_extension.dart';
import 'package:easy_pay/presentation/themes/colors/app_default_colors.dart';
import 'package:easy_pay/presentation/themes/typography/app_typography.dart';
import 'package:easy_pay/presentation/themes/typography/app_typography_extension.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData buildTheme({
    required String fontFamily,
    AppColors? appColors,
    bool isGoogleFonts = true,
    String? package,
    Brightness brightness = Brightness.light,
  }) {
    final colors = appColors ?? AppDefaultColors.colors;
    final typography = AppTypography.create(
      fontFamily: fontFamily,
      isGoogleFonts: isGoogleFonts,
      package: package,
    );
    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      extensions: [
        AppTypographyExtension.from(typography),
        AppColorsExtension.from(colors),
      ],
      appBarTheme: AppBarTheme(
        elevation: 0,
        backgroundColor: colors.neutral0,
        centerTitle: true,
        titleTextStyle: typography.text18W700.copyWith(
          color: colors.neutral900,
        ),
      ),
      scaffoldBackgroundColor: colors.neutral0,
      dividerTheme: DividerThemeData(color: colors.neutral100),
      progressIndicatorTheme: ProgressIndicatorThemeData(color: colors.primary),
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: colors.primary,
        selectionHandleColor: colors.primary,
      ),
    );
  }
}
