import 'package:easy_pay/presentation/extensions/context_extension.dart';
import 'package:flutter/material.dart';

class ErrorSnackBar {
  static SnackBar show(BuildContext context, String text) {
    return _EasyPaySnackBar(
      text: text,
      backgroundColor: context.appColors.semanticError,
    ).build(context);
  }
}

class InfoSnackBar {
  static SnackBar show(BuildContext context, String text) {
    return _EasyPaySnackBar(
      text: text,
      backgroundColor: context.appColors.primary,
    ).build(context);
  }
}

class _EasyPaySnackBar extends StatelessWidget {
  const _EasyPaySnackBar({required this.text, required this.backgroundColor});

  final String text;
  final Color backgroundColor;

  @override
  SnackBar build(BuildContext context) {
    return SnackBar(
      backgroundColor: backgroundColor,
      content: Text(
        text,
        style: context.appTypography.text18W700.copyWith(
          color: context.appColors.neutral900,
          overflow: TextOverflow.visible,
        ),
      ),
    );
  }
}
