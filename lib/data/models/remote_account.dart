import 'package:clean_arch_flutter/domain/entities/entities.dart';

class RemoteAccountModel {
  final String accessToken;

  RemoteAccountModel(this.accessToken);

  factory RemoteAccountModel.fromJson(Map json) =>
      RemoteAccountModel(json['accessToken']);

  AccountEntity toEntity() => AccountEntity(accessToken);
}
