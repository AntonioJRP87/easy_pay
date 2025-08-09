import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_pay/data/remote_data_source/ease_pay_remote_data_source.dart';
import 'package:easy_pay/data/repositories/easy_pay_repository.dart';
import 'package:easy_pay/domain/repositories/easy_pay_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';

final dataDi = GetIt.I;

void dataInitDi() async {
  /// External services
  dataDi.registerLazySingleton<FirebaseFirestore>(
    () => FirebaseFirestore.instance,
  );

  dataDi.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);

  /// Data sources
  dataDi.registerLazySingleton<EasyPayRemoteDataSourceContract>(
    () => EasyPayRemoteDataSource(dataDi(), dataDi()),
  );

  /// Repositories
  dataDi.registerLazySingleton<EasyPayRepositoryContract>(
    () => EasyPayRepository(dataDi()),
  );
}
