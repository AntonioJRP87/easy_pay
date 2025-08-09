import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_pay/domain/errors/errors.dart';
import 'package:easy_pay/domain/use_cases/sign_in_use_case.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_in_event.dart';

part 'sign_in_state.dart';

part 'sign_in_bloc.freezed.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final SignInUseCaseContract _signInUseCase;

  SignInBloc(this._signInUseCase) : super(const SignInState()) {
    on<SignInEvent>((event, emit) {
      return switch (event) {
        UpdateEmail() => _onUpdateEmail(event, emit),
        UpdatePass() => _onUpdatePass(event, emit),
        SignIn() => _onSignIn(event, emit),
        ShowPass() => _onShowPass(event, emit),
      };
    });
  }

  void _onUpdateEmail(UpdateEmail event, Emitter<SignInState> emit) async {
    emit(state.copyWith(email: event.email));
  }

  void _onUpdatePass(UpdatePass event, Emitter<SignInState> emit) async {
    emit(state.copyWith(pass: event.pass));
  }

  void _onSignIn(SignIn event, Emitter<SignInState> emit) async {
    emit(state.copyWith(status: SignInStatus.loading));

    final resul = await _signInUseCase.signIn(event.email, event.pass);

    if (resul.isSuccess) {
      emit(state.copyWith(status: SignInStatus.success));
    }

    if (resul.isFailure) {
      emit(state.copyWith(status: SignInStatus.error, error: resul.error));
      emit(state.copyWith(status: SignInStatus.initial));
    }
  }

  void _onShowPass(ShowPass event, Emitter<SignInState> emit) async {
    emit(state.copyWith(showPass: !state.showPass));
  }
}
