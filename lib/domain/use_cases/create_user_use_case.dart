import 'package:easy_pay/domain/errors/errors.dart';
import 'package:easy_pay/domain/models/result.dart';
import 'package:easy_pay/domain/repositories/easy_pay_repository.dart';

abstract class CreateUserUseCaseContract {
  Future<Result<String, Errors>> createUser(String email, String pass);
}

class CreateUserUseCase implements CreateUserUseCaseContract {
  CreateUserUseCase(this._easyPayRepository);

  final EasyPayRepositoryContract _easyPayRepository;

  @override
  Future<Result<String, Errors>> createUser(String email, String pass) async {
    return await _easyPayRepository.createUser(email, pass);
  }
}
