import 'package:easy_pay/domain/errors/errors.dart';
import 'package:easy_pay/presentation/extensions/context_extension.dart';
import 'package:flutter/material.dart';

mixin ErrorsMessageMixin {
  String errorText(BuildContext context, Errors error) {
    return switch (error) {
      Unknown() => context.localizations.unknown_error,
      NetworkRequestFailed() => context.localizations.network_error,
      EmailInUse() => context.localizations.email_in_use,
      UserNotExist() => context.localizations.user_not_exist,
      WeakPassword() => context.localizations.weak_password,
      InvalidCredential() => context.localizations.invalid_credentials,
      InvalidEmail() => context.localizations.invalid_email,
    };
  }
}
