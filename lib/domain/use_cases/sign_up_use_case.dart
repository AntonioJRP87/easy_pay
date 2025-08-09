import 'package:easy_pay/domain/errors/errors.dart';
import 'package:easy_pay/domain/models/result.dart';
import 'package:easy_pay/domain/repositories/easy_pay_repository.dart';

abstract class SignUpUseCaseContract {
  Future<Result<void, Errors>> signUp(String id, String name, String email);
}

class SignUpUseCase implements SignUpUseCaseContract {
  SignUpUseCase(this._easyPayRepository);

  final EasyPayRepositoryContract _easyPayRepository;

  @override
  Future<Result<void, Errors>> signUp(String id, String name, String email) async {
    return await _easyPayRepository.signUp(id, name, email);
  }
}
