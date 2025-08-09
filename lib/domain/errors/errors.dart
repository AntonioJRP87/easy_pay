import 'package:freezed_annotation/freezed_annotation.dart';

part 'errors.freezed.dart';

@freezed
sealed class Errors with _$Errors {
  /// General Errors
  const factory Errors.unknown() = Unknown;

  /// Red Errors
  const factory Errors.networkRequestFailed() = NetworkRequestFailed;

  ///Errors Authentication
  const factory Errors.emailInUse() = EmailInUse;

  const factory Errors.weakPassword() = WeakPassword;

  const factory Errors.userNotExist() = UserNotExist;

  const factory Errors.invalidCredential() = InvalidCredential;

  const factory Errors.invalidEmail() = InvalidEmail;
}
