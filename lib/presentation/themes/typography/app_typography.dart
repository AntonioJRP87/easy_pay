import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTypography {
  AppTypography({
    required this.text28W700,
    required this.text22W700,
    required this.text18W700,
    required this.text16W400,
    required this.text16W700,
    required this.text14W400,
    required this.text12W400,
  });

  final TextStyle text28W700;
  final TextStyle text22W700;
  final TextStyle text18W700;
  final TextStyle text16W400;
  final TextStyle text16W700;
  final TextStyle text14W400;
  final TextStyle text12W400;

  factory AppTypography.create({
    required String fontFamily,
    required bool isGoogleFonts,
    String? package,
    double scale = 1.0,
  }) {
    TextStyle style(double size, FontWeight weight) {
      final base = TextStyle(
        package: package,
        fontSize: size * scale,
        fontWeight: weight,
        overflow: TextOverflow.visible,
      );
      return isGoogleFonts
          ? GoogleFonts.getFont(fontFamily, textStyle: base)
          : base.copyWith(fontFamily: fontFamily);
    }

    return AppTypography(
      text28W700: style(28, FontWeight.w700),
      text22W700: style(22, FontWeight.w700),
      text18W700: style(18, FontWeight.w700),
      text16W400: style(16, FontWeight.w400),
      text16W700: style(16, FontWeight.w700),
      text14W400: style(14, FontWeight.w400),
      text12W400: style(12, FontWeight.w400),
    );
  }

  AppTypography copyWith({
    TextStyle? text28W700,
    TextStyle? text22W700,
    TextStyle? text18W700,
    TextStyle? text16W400,
    TextStyle? text16W700,
    TextStyle? text14W400,
    TextStyle? text12W400,
  }) {
    return AppTypography(
      text28W700: text28W700 ?? this.text28W700,
      text22W700: text22W700 ?? this.text22W700,
      text18W700: text18W700 ?? this.text18W700,
      text16W400: text16W400 ?? this.text16W400,
      text16W700: text16W700 ?? this.text16W700,
      text14W400: text14W400 ?? this.text14W400,
      text12W400: text12W400 ?? this.text12W400,
    );
  }

  AppTypography lerp(AppTypography other, double t) {
    return AppTypography(
      text28W700: TextStyle.lerp(text28W700, other.text28W700, t)!,
      text22W700: TextStyle.lerp(text22W700, other.text22W700, t)!,
      text18W700: TextStyle.lerp(text18W700, other.text18W700, t)!,
      text16W400: TextStyle.lerp(text16W400, other.text16W400, t)!,
      text16W700: TextStyle.lerp(text16W700, other.text16W700, t)!,
      text14W400: TextStyle.lerp(text14W400, other.text14W400, t)!,
      text12W400: TextStyle.lerp(text12W400, other.text12W400, t)!,
    );
  }
}
