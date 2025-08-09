import 'package:easy_pay/presentation/extensions/context_extension.dart';
import 'package:easy_pay/presentation/screens/recovery_pass/bloc/recovery_pass_bloc.dart';
import 'package:easy_pay/presentation/widgets/widgets.dart';
import 'package:easy_pay/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

class RecoveryPassPage extends StatelessWidget with ErrorsMessageMixin {
  const RecoveryPassPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetIt.I<RecoveryPassBloc>(),
      child: BlocConsumer<RecoveryPassBloc, RecoveryPassState>(
        listener: (context, state) {
          if (state.status == RecoveryPassStatus.success) {
            context.showSnackBar(
              InfoSnackBar.show(context, context.localizations.review_email),
            );
            context.goNamed(RoutersName.signIn);
          }
          if (state.status == RecoveryPassStatus.error) {
            context.showSnackBar(
              ErrorSnackBar.show(context, errorText(context, state.error!)),
            );
          }
        },
        builder: (context, state) {
          return CustomScaffold(
            titleAppBar: context.localizations.recovery_pass,
            body: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    context.localizations.forgot_pass,
                    style: context.appTypography.text22W700,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    context.localizations.info_recovery_pass,
                    style: context.appTypography.text16W400,
                  ),
                  const SizedBox(height: 20),
                  CustomTextField(
                    hintText: context.localizations.email_address,
                    onChanged: (value) => context.read<RecoveryPassBloc>().add(
                      RecoveryPassEvent.updateEmail(value),
                    ),
                  ),
                  const SizedBox(height: 20),
                  state.status == RecoveryPassStatus.loading
                      ? CircularLoader()
                      : CustomElevatedButton(
                          title: context.localizations.recovery_pass,
                          width: double.infinity,
                          onPressed: () {
                            context.read<RecoveryPassBloc>().add(
                              RecoveryPassEvent.recoveryPass(state.email),
                            );
                          },
                        ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
