import 'package:easy_pay/presentation/extensions/context_extension.dart';
import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({super.key, this.onPressed, required this.title});

  final void Function()? onPressed;
  final String title;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
        overlayColor: WidgetStateProperty.all(
          context.appColors.grayBlue.withValues(alpha: 0.1),
        ),
      ),
      child: Text(
        title,
        style: context.appTypography.text14W400.copyWith(
          color: context.appColors.grayBlue,
        ),
      ),
    );
  }
}
