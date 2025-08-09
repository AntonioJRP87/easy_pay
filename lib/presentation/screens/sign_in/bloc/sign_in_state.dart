part of 'sign_in_bloc.dart';

enum SignInStatus { initial, loading, success, error }

@freezed
sealed class SignInState with _$SignInState {
  const factory SignInState({
    @Default(SignInStatus.initial) SignInStatus status,
    @Default('') String email,
    @Default('') String pass,
    @Default(false) bool showPass,
    Errors? error,
  }) = Initial;
}
