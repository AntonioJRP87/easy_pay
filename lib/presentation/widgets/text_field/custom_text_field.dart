import 'package:easy_pay/presentation/extensions/context_extension.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.hintText,
    this.title,
    this.onChanged,
    this.suffixIcon,
    this.obscureText,
    this.validator,
  });

  final String? hintText;
  final String? title;
  final Function(String)? onChanged;
  final Widget? suffixIcon;
  final bool? obscureText;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title?.isNotEmpty == true) ...[
          Text(
            title!,
            style: context.appTypography.text16W400.copyWith(
              color: context.appColors.neutral900,
            ),
          ),
          const SizedBox(height: 8),
        ],
        TextFormField(
          decoration: InputDecoration(
            hintText: hintText,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none,
            ),
            filled: true,
            fillColor: context.appColors.neutral50,
            hintStyle: context.appTypography.text16W400.copyWith(
              color: context.appColors.grayBlue,
            ),
            suffixIcon: suffixIcon,
          ),
          onChanged: onChanged,
          obscureText: obscureText ?? false,
          validator:
              validator ??
              (value) {
                if (value == null || value.isEmpty) {
                  return context.localizations.field_required;
                }
                return null;
              },
        ),
      ],
    );
  }
}
