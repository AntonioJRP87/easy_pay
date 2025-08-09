import 'package:easy_pay/presentation/extensions/context_extension.dart';
import 'package:easy_pay/presentation/widgets/buttons/custom_elevated_button.dart';
import 'package:easy_pay/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Image.asset(
              'assets/images/welcome.png',
              fit: BoxFit.contain,
              width: double.infinity,
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  Text(
                    context.localizations.welcome_to_easy_pay,
                    style: context.appTypography.text28W700,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    context.localizations.info_welcome,
                    style: context.appTypography.text16W400,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: CustomElevatedButton(
                title: context.localizations.get_started,
                width: double.infinity,
                onPressed: () {
                  context.goNamed(RoutersName.signIn);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}