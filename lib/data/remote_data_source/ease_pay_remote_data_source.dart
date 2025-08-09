import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_pay/data/errors/errors_extension.dart';
import 'package:easy_pay/data/models/remote/user_remote_entity.dart';
import 'package:easy_pay/domain/errors/errors.dart';
import 'package:easy_pay/domain/models/result.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class EasyPayRemoteDataSourceContract {
  Future<Result<void, Errors>> signUp(String id, String name, String email);

  Future<Result<String, Errors>> createUser(String email, String pass);

  Future<Result<void, Errors>> signIn(String email, String pass);

  Future<Result<void, Errors>> recoveryPass(String email);
}

class EasyPayRemoteDataSource implements EasyPayRemoteDataSourceContract {
  EasyPayRemoteDataSource(this._firestore, this._firebaseAuth);

  final FirebaseFirestore _firestore;
  final FirebaseAuth _firebaseAuth;

  @override
  Future<Result<void, Errors>> signUp(
    String id,
    String name,
    String email,
  ) async {
    try {
      final userId = _firebaseAuth.currentUser?.uid;

      UserRemoteEntity userRemoteEntity = UserRemoteEntity(
        id: id,
        name: name,
        email: email,
      );

      await _firestore
          .collection('users')
          .doc(userId)
          .set(userRemoteEntity.toFirestore());
      return Result.success(null);
    } catch (e) {
      return Result.failure(_authErrors(e));
    }
  }

  Errors _authErrors(dynamic error) {
    if (error is FirebaseAuthException) {
      return error.toDomainError();
    }
    return const Errors.unknown();
  }

  @override
  Future<Result<String, Errors>> createUser(String email, String pass) async {
    try {
      final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: pass,
      );
      return Result.success(userCredential.user!.uid);
    } on FirebaseAuthException catch (e) {
      return Result.failure(e.toDomainError());
    } catch (e) {
      return Result.failure(_authErrors(e));
    }
  }

  @override
  Future<Result<void, Errors>> signIn(String email, String pass) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: pass,
      );
      return Result.success(null);
    } on FirebaseAuthException catch (e) {
      return Result.failure(e.toDomainError());
    } catch (e) {
      return Result.failure(_authErrors(e));
    }
  }

  @override
  Future<Result<void, Errors>> recoveryPass(String email) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
      return Result.success(null);
    } on FirebaseAuthException catch (e) {
      return Result.failure(e.toDomainError());
    } catch (e) {
      return Result.failure(_authErrors(e));
    }
  }
}
