import 'package:easy_pay/domain/use_cases/create_user_use_case.dart';
import 'package:easy_pay/domain/use_cases/sign_up_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_pay/domain/errors/errors.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_up_event.dart';

part 'sign_up_state.dart';

part 'sign_up_bloc.freezed.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final SignUpUseCaseContract _signUpUseCase;
  final CreateUserUseCaseContract _createUserUseCase;

  SignUpBloc(this._signUpUseCase, this._createUserUseCase)
    : super(const SignUpState()) {
    on<SignUpEvent>((event, emit) {
      return switch (event) {
        UpdateFullName() => _onUpdateFullName(event, emit),
        UpdateEmail() => _onUpdateEmail(event, emit),
        UpdatePass() => _onUpdatePass(event, emit),
        UpdateConfirmPass() => _onUpdateConfirmPass(event, emit),
        SignUp() => _onSignUp(event, emit),
        ShowPass() => _onShowPass(event, emit),
        ShowConfirmPass() => _onShowConfirmPass(event, emit),
      };
    });
  }

  void _onUpdateFullName(
    UpdateFullName event,
    Emitter<SignUpState> emit,
  ) async {
    emit(state.copyWith(fullName: event.fullName));
  }

  void _onUpdateEmail(UpdateEmail event, Emitter<SignUpState> emit) async {
    emit(state.copyWith(email: event.email));
  }

  void _onUpdatePass(UpdatePass event, Emitter<SignUpState> emit) async {
    emit(
      state.copyWith(
        pass: event.pass,
        passError:
            event.pass != state.confirmPass && state.confirmPass.isNotEmpty,
      ),
    );
  }

  void _onUpdateConfirmPass(
    UpdateConfirmPass event,
    Emitter<SignUpState> emit,
  ) async {
    emit(
      state.copyWith(
        confirmPass: event.confirmPass,
        passError:
            event.confirmPass != state.pass && event.confirmPass.isNotEmpty,
      ),
    );
  }

  void _onSignUp(SignUp event, Emitter<SignUpState> emit) async {
    emit(state.copyWith(status: SignUpStatus.loading));

    final userResult = await _createUserUseCase.createUser(
      event.email,
      event.pass,
    );

    if (userResult.isFailure) {
      emit(state.copyWith(status: SignUpStatus.error, error: userResult.error));
      emit(state.copyWith(status: SignUpStatus.initial));
    }

    final id = userResult.data!;

    final result = await _signUpUseCase.signUp(id, event.fullName, event.email);

    if (result.isSuccess) {
      emit(state.copyWith(status: SignUpStatus.success));
    }

    if (result.isFailure) {
      emit(state.copyWith(status: SignUpStatus.error, error: result.error));
      emit(state.copyWith(status: SignUpStatus.initial));
    }
  }

  void _onShowPass(ShowPass event, Emitter<SignUpState> emit) async {
    emit(state.copyWith(showPass: !state.showPass));
  }

  void _onShowConfirmPass(
    ShowConfirmPass event,
    Emitter<SignUpState> emit,
  ) async {
    emit(state.copyWith(showConfirmPass: !state.showConfirmPass));
  }
}
