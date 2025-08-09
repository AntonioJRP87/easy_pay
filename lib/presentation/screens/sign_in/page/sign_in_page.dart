import 'package:easy_pay/presentation/extensions/context_extension.dart';
import 'package:easy_pay/presentation/extensions/validator_extension.dart';
import 'package:easy_pay/presentation/screens/sign_in/bloc/sign_in_bloc.dart';
import 'package:easy_pay/presentation/widgets/widgets.dart';
import 'package:easy_pay/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

class SignInPage extends StatelessWidget with ErrorsMessageMixin {
  SignInPage({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetIt.I<SignInBloc>(),
      child: BlocConsumer<SignInBloc, SignInState>(
        listener: (context, state) {
          if (state.status == SignInStatus.success) {
            context.showSnackBar(
              InfoSnackBar.show(
                context,
                context.localizations.successfully_registered,
              ),
            );
            context.goNamed(RoutersName.controlPanel);
          }
          if (state.status == SignInStatus.error) {
            context.showSnackBar(
              ErrorSnackBar.show(context, errorText(context, state.error!)),
            );
          }
        },
        builder: (context, state) {
          return CustomScaffold(
            titleAppBar: context.localizations.sign_in,
            body: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 8,
              ),
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTextField(
                        hintText: context.localizations.email_address,
                        onChanged: (value) => context.read<SignInBloc>().add(
                          SignInEvent.updateEmail(value),
                        ),
                        validator: (value) => !value!.isValidEmail
                            ? context.localizations.valid_email
                            : null,
                      ),
                      const SizedBox(height: 24),
                      CustomTextField(
                        hintText: context.localizations.pass,
                        onChanged: (value) => context.read<SignInBloc>().add(
                          SignInEvent.updatePass(value),
                        ),
                        suffixIcon: InkWell(
                          child: state.showPass
                              ? Icon(Icons.visibility_off_outlined)
                              : Icon(Icons.visibility),
                          onTap: () => context.read<SignInBloc>().add(
                            SignInEvent.showPass(),
                          ),
                        ),
                        obscureText: !state.showPass,
                      ),
                      const SizedBox(height: 24),
                      CustomTextButton(
                        title: context.localizations.forgot_pass,
                        onPressed: () {
                          context.goNamed(RoutersName.forgotPass);
                        },
                      ),
                      const SizedBox(height: 150),
                      state.status == SignInStatus.loading
                          ? CircularLoader()
                          : CustomElevatedButton(
                              title: context.localizations.sign_in,
                              width: double.infinity,
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  context.read<SignInBloc>().add(
                                    SignInEvent.signIn(state.email, state.pass),
                                  );
                                }
                              },
                            ),
                      const SizedBox(height: 24),
                      Center(
                        child: CustomTextButton(
                          title: context.localizations.not_account,
                          onPressed: () {
                            context.pushNamed(RoutersName.signUp);
                          },
                        ),
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
