import 'package:easy_pay/domain/use_cases/create_user_use_case.dart';
import 'package:easy_pay/domain/use_cases/recovery_pass_use_case.dart';
import 'package:easy_pay/domain/use_cases/sign_in_use_case.dart';
import 'package:easy_pay/domain/use_cases/sign_up_use_case.dart';
import 'package:get_it/get_it.dart';

final domainDi = GetIt.I;

void domainInitDi() {
  domainDi.registerLazySingleton<SignUpUseCaseContract>(
    () => SignUpUseCase(domainDi()),
  );

  domainDi.registerLazySingleton<CreateUserUseCaseContract>(
    () => CreateUserUseCase(domainDi()),
  );

  domainDi.registerLazySingleton<SignInUseCaseContract>(
    () => SignInUseCase(domainDi()),
  );

  domainDi.registerLazySingleton<RecoveryPassUseCaseContract>(
    () => RecoveryPassUseCase(domainDi()),
  );
}
