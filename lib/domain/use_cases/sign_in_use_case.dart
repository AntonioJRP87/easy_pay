import 'package:easy_pay/domain/errors/errors.dart';
import 'package:easy_pay/domain/models/result.dart';
import 'package:easy_pay/domain/repositories/easy_pay_repository.dart';

abstract class SignInUseCaseContract {
  Future<Result<void, Errors>> signIn(String email, String pass);
}

class SignInUseCase implements SignInUseCaseContract {
  SignInUseCase(this._easyPayRepository);

  final EasyPayRepositoryContract _easyPayRepository;

  @override
  Future<Result<void, Errors>> signIn(String email, String pass) async {
    return await _easyPayRepository.signIn(email, pass);
  }
}
