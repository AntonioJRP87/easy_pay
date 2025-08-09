import 'package:easy_pay/domain/errors/errors.dart';
import 'package:easy_pay/domain/models/result.dart';
import 'package:easy_pay/domain/repositories/easy_pay_repository.dart';

abstract class RecoveryPassUseCaseContract {
  Future<Result<void, Errors>> recoveryPass(String email);
}

class RecoveryPassUseCase implements RecoveryPassUseCaseContract {
  RecoveryPassUseCase(this._easyPayRepository);

  final EasyPayRepositoryContract _easyPayRepository;

  @override
  Future<Result<void, Errors>> recoveryPass(String email) async {
    return _easyPayRepository.recoveryPass(email);
  }
}
