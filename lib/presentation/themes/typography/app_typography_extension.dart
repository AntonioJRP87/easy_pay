import 'package:easy_pay/presentation/themes/typography/app_typography.dart';
import 'package:flutter/material.dart';

class AppTypographyExtension extends ThemeExtension<AppTypographyExtension> {
  AppTypographyExtension({
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

  factory AppTypographyExtension.from(AppTypography typo) {
    return AppTypographyExtension(
      text28W700: typo.text28W700,
      text22W700: typo.text22W700,
      text18W700: typo.text18W700,
      text16W400: typo.text16W400,
      text16W700: typo.text16W700,
      text14W400: typo.text14W400,
      text12W400: typo.text12W400,
    );
  }

  @override
  AppTypographyExtension copyWith({
    TextStyle? text28W700,
    TextStyle? text22W700,
    TextStyle? text18W700,
    TextStyle? text16W400,
    TextStyle? text16W700,
    TextStyle? text14W400,
    TextStyle? text12W400,
  }) {
    return AppTypographyExtension(
      text28W700: text28W700 ?? this.text28W700,
      text22W700: text22W700 ?? this.text22W700,
      text18W700: text18W700 ?? this.text18W700,
      text16W400: text16W400 ?? this.text16W400,
      text16W700: text16W700 ?? this.text16W700,
      text14W400: text14W400 ?? this.text14W400,
      text12W400: text12W400 ?? this.text12W400,
    );
  }

  @override
  AppTypographyExtension lerp(AppTypographyExtension other, double t) {
    return AppTypographyExtension(
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
