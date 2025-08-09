part of 'sign_up_bloc.dart';

@freezed
sealed class SignUpEvent with _$SignUpEvent {
  const factory SignUpEvent.updateFullName(String fullName) = UpdateFullName;

  const factory SignUpEvent.updateEmail(String email) = UpdateEmail;

  const factory SignUpEvent.updatePass(String pass) = UpdatePass;

  const factory SignUpEvent.updateConfirmPass(String confirmPass) =
      UpdateConfirmPass;

  const factory SignUpEvent.signUp(String fullName, String email, String pass) =
      SignUp;

  const factory SignUpEvent.showPass() = ShowPass;

  const factory SignUpEvent.showConfirmPass() = ShowConfirmPass;
}
