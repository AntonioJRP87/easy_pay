part of 'sign_up_bloc.dart';

enum SignUpStatus {initial, loading, success, error}

@freezed
abstract class SignUpState with _$SignUpState {
  const factory SignUpState({
    @Default(SignUpStatus.initial) SignUpStatus status,
    @Default('') String fullName,
    @Default('') String email,
    @Default('') String pass,
    @Default('') String confirmPass,
    @Default(false) bool showPass,
    @Default(false) bool showConfirmPass,
    @Default(false) bool passError,
    Errors? error,
}) = Initial;
}
