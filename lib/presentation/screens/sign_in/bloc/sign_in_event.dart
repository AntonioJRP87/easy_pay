part of 'sign_in_bloc.dart';

@freezed
sealed class SignInEvent with _$SignInEvent {
  const factory SignInEvent.updateEmail(String email) = UpdateEmail;
  const factory SignInEvent.updatePass(String pass) = UpdatePass;
  const factory SignInEvent.signIn(String email, String pass) = SignIn;
  const factory SignInEvent.showPass() = ShowPass;
}
