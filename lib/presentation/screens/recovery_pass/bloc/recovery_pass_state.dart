part of 'recovery_pass_bloc.dart';

enum RecoveryPassStatus {initial, loading, success, error}

@freezed
abstract class RecoveryPassState with _$RecoveryPassState {
  const factory RecoveryPassState({
    @Default(RecoveryPassStatus.initial) RecoveryPassStatus status,
    @Default('') String email,
    Errors? error,
}) = Initial;
}
