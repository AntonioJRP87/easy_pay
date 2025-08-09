import 'package:easy_pay/domain/errors/errors.dart';
import 'package:easy_pay/domain/models/result.dart';

abstract class EasyPayRepositoryContract{
  Future<Result<void, Errors>> signUp(String id, String name, String email);
  Future<Result<String, Errors>> createUser(String email, String pass);
  Future<Result<void, Errors>> signIn(String email, String pass);
  Future<Result<void, Errors>> recoveryPass(String email);
}