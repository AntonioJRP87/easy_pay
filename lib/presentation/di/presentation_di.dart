import 'package:easy_pay/presentation/screens/recovery_pass/bloc/recovery_pass_bloc.dart';
import 'package:easy_pay/presentation/screens/sign_in/bloc/sign_in_bloc.dart';
import 'package:easy_pay/presentation/screens/sign_up/bloc/sign_up_bloc.dart';
import 'package:get_it/get_it.dart';

final presentationDi = GetIt.I;

void presentationInitDi() {
  presentationDi.registerFactory(
    () => SignUpBloc(presentationDi(), presentationDi()),
  );

  presentationDi.registerFactory(() => SignInBloc(presentationDi()));

  presentationDi.registerFactory(() => RecoveryPassBloc(presentationDi()));
}
