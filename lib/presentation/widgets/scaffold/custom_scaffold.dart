import 'package:easy_pay/presentation/extensions/context_extension.dart';
import 'package:flutter/material.dart';

class CustomScaffold extends StatelessWidget {
  const CustomScaffold({
    super.key,
    required this.titleAppBar,
    required this.body,
  });

  final String titleAppBar;
  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          titleAppBar,
          style: context.appTypography.text18W700.copyWith(
            color: context.appColors.neutral900,
          ),
        ),
      ),
      body: body,
    );
  }
}
