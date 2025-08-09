import 'package:easy_pay/domain/models/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_remote_entity.freezed.dart';

part 'user_remote_entity.g.dart';

@freezed
abstract class UserRemoteEntity with _$UserRemoteEntity {
  const factory UserRemoteEntity({
    required String id,
    String? name,
    String? email,
  }) = _UserRemoteEntity;

  factory UserRemoteEntity.fromJson(Map<String, dynamic> json) =>
      _$UserRemoteEntityFromJson(json);
}

extension UserRemoteEntityExtension on UserRemoteEntity {
  User toUser() {
    return User(id: id, name: name ?? '', email: email ?? '');
  }

  Map<String, dynamic> toFirestore() {
    return {'name': name, 'email': email};
  }
}

extension UserExtension on User {
  UserRemoteEntity toUser() {
    return UserRemoteEntity(id: id, name: name, email: email);
  }
}
