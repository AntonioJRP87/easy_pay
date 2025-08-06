import 'package:easy_pay/presentation/l10n/gen_l10n/app_localizations.dart';
import 'package:easy_pay/presentation/themes/colors/app_colors_extension.dart';
import 'package:easy_pay/presentation/themes/typography/app_typography_extension.dart';
import 'package:flutter/material.dart';

extension BuildContextExtension on BuildContext {
  AppLocalizations get localizations => AppLocalizations.of(this);

  AppColorsExtension get appColors =>
      Theme.of(this).extension<AppColorsExtension>()!;

  AppTypographyExtension get appTypography =>
      Theme.of(this).extension<AppTypographyExtension>()!;

  void showSnackBar(SnackBar snackBar) =>
      ScaffoldMessenger.of(this).showSnackBar(snackBar);
}
