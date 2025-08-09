import 'package:easy_pay/domain/errors/errors.dart';
import 'package:firebase_auth/firebase_auth.dart';

extension ErrorsExtension on FirebaseAuthException {
  Errors toDomainError() {
    if (code == 'network-request-failed' ||
        code == 'unavailable' ||
        code == 'timeout' ||
        message?.contains('network') == true) {
      return const Errors.networkRequestFailed();
    }

    return switch (code) {
      'weak-password' => const Errors.weakPassword(),
      'email-already-in-use' => const Errors.emailInUse(),
      'invalid-credential' => const Errors.invalidCredential(),
      'invalid-email' => const Errors.invalidEmail(),
      'user-not-found' => const Errors.userNotExist(),
      _ => const Errors.unknown(),
    };
  }
}
