part of 'recovery_pass_bloc.dart';

@freezed
sealed class RecoveryPassEvent with _$RecoveryPassEvent {
  const factory RecoveryPassEvent.updateEmail(String email) = UpdateEmail;
  const factory RecoveryPassEvent.recoveryPass(String email) = RecoveryPass;
}
