import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_pay/domain/errors/errors.dart';
import 'package:easy_pay/domain/use_cases/recovery_pass_use_case.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'recovery_pass_event.dart';

part 'recovery_pass_state.dart';

part 'recovery_pass_bloc.freezed.dart';

class RecoveryPassBloc extends Bloc<RecoveryPassEvent, RecoveryPassState> {
  final RecoveryPassUseCaseContract _recoveryPassUseCase;

  RecoveryPassBloc(this._recoveryPassUseCase)
    : super(const RecoveryPassState()) {
    on<RecoveryPassEvent>((event, emit) {
      return switch (event) {
        UpdateEmail() => _onUpdateEmail(event, emit),
        RecoveryPass() => _onRecoveryPass(event, emit),
      };
    });
  }

  void _onUpdateEmail(
    UpdateEmail event,
    Emitter<RecoveryPassState> emit,
  ) async {
    emit(state.copyWith(email: event.email));
  }

  void _onRecoveryPass(
    RecoveryPass event,
    Emitter<RecoveryPassState> emit,
  ) async {
    emit(state.copyWith(status: RecoveryPassStatus.loading));

    final result = await _recoveryPassUseCase.recoveryPass(event.email);

    if (result.isSuccess) {
      emit(state.copyWith(status: RecoveryPassStatus.success));
    }

    if (result.isFailure) {
      emit(
        state.copyWith(status: RecoveryPassStatus.error, error: result.error),
      );
      emit(state.copyWith(status: RecoveryPassStatus.initial));
    }
  }
}
