import 'dart:ui';

class AppColors {
  AppColors({
    required this.primary,
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
  });

  //App
  final Color primary;
  final Color grayBlue;

  // Neutrals
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

  AppColors lerp(AppColors other, double t) {
    return AppColors(
      primary: Color.lerp(primary, other.primary, t) ?? primary,
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
    );
  }
}
