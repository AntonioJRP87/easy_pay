import 'package:easy_pay/presentation/extensions/context_extension.dart';
import 'package:easy_pay/presentation/extensions/validator_extension.dart';
import 'package:easy_pay/presentation/screens/sign_up/bloc/sign_up_bloc.dart';
import 'package:easy_pay/presentation/widgets/widgets.dart';
import 'package:easy_pay/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

class SignUpPage extends StatelessWidget with ErrorsMessageMixin {
  SignUpPage({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetIt.I<SignUpBloc>(),
      child: BlocConsumer<SignUpBloc, SignUpState>(
        listener: (context, state) {
          if (state.status == SignUpStatus.success) {
            context.showSnackBar(
              InfoSnackBar.show(
                context,
                context.localizations.successfully_registered,
              ),
            );
            context.goNamed(RoutersName.signIn);
          }
          if (state.status == SignUpStatus.error) {
            context.showSnackBar(
              ErrorSnackBar.show(context, errorText(context, state.error!)),
            );
          }
        },
        builder: (context, state) {
          return Form(
            key: _formKey,
            child: CustomScaffold(
              titleAppBar: context.localizations.sign_up,
              body: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 12,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      CustomTextField(
                        hintText: context.localizations.full_name,
                        title: context.localizations.full_name,
                        onChanged: (value) => context.read<SignUpBloc>().add(
                          SignUpEvent.updateFullName(value),
                        ),
                      ),
                      const SizedBox(height: 12),
                      CustomTextField(
                        hintText: context.localizations.email_address,
                        title: context.localizations.email_address,
                        onChanged: (value) => context.read<SignUpBloc>().add(
                          SignUpEvent.updateEmail(value),
                        ),
                        validator: (value) => !value!.isValidEmail
                            ? context.localizations.valid_email
                            : null,
                      ),
                      const SizedBox(height: 12),
                      CustomTextField(
                        hintText: context.localizations.pass,
                        title: context.localizations.pass,
                        onChanged: (value) => context.read<SignUpBloc>().add(
                          SignUpEvent.updatePass(value),
                        ),
                        suffixIcon: InkWell(
                          child: state.showPass
                              ? Icon(Icons.visibility_off_outlined)
                              : Icon(Icons.visibility),
                          onTap: () => context.read<SignUpBloc>().add(
                            SignUpEvent.showPass(),
                          ),
                        ),
                        obscureText: !state.showPass,
                      ),
                      const SizedBox(height: 12),
                      CustomTextField(
                        hintText: context.localizations.confirm_pass,
                        title: context.localizations.confirm_pass,
                        onChanged: (value) => context.read<SignUpBloc>().add(
                          SignUpEvent.updateConfirmPass(value),
                        ),
                        suffixIcon: InkWell(
                          child: state.showConfirmPass
                              ? Icon(Icons.visibility_off_outlined)
                              : Icon(Icons.visibility),
                          onTap: () => context.read<SignUpBloc>().add(
                            SignUpEvent.showConfirmPass(),
                          ),
                        ),
                        obscureText: !state.showConfirmPass,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return context.localizations.field_required;
                          }
                          if (state.passError) {
                            return context.localizations.pass_not_match;
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 30),
                      state.status == SignUpStatus.loading
                          ? CircularLoader()
                          : CustomElevatedButton(
                              title: context.localizations.sign_up,
                              width: double.infinity,
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  context.read<SignUpBloc>().add(
                                    SignUpEvent.signUp(
                                      state.fullName,
                                      state.email,
                                      state.pass,
                                    ),
                                  );
                                }
                              },
                            ),
                      const SizedBox(height: 20),
                      CustomTextButton(
                        title: context.localizations.already_account,
                        onPressed: () {
                          context.goNamed(RoutersName.signIn);
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
