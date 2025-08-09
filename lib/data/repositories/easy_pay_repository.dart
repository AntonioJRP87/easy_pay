import 'package:easy_pay/data/remote_data_source/ease_pay_remote_data_source.dart';
import 'package:easy_pay/domain/errors/errors.dart';
import 'package:easy_pay/domain/models/result.dart';
import 'package:easy_pay/domain/repositories/easy_pay_repository.dart';

class EasyPayRepository implements EasyPayRepositoryContract {
  EasyPayRepository(this._easyPayRemoteDataSource);

  final EasyPayRemoteDataSourceContract _easyPayRemoteDataSource;

  @override
  Future<Result<void, Errors>> signUp(
    String id,
    String name,
    String email,
  ) async {
    return _easyPayRemoteDataSource.signUp(id, name, email);
  }

  @override
  Future<Result<String, Errors>> createUser(String email, String pass) async {
    return _easyPayRemoteDataSource.createUser(email, pass);
  }

  @override
  Future<Result<void, Errors>> signIn(String email, String pass) async {
    return _easyPayRemoteDataSource.signIn(email, pass);
  }

  @override
  Future<Result<void, Errors>> recoveryPass(String email) async {
    return _easyPayRemoteDataSource.recoveryPass(email);
  }
}
