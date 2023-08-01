// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'UserModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map json) => UserModel(
      json['id'] as String,
      json['name'] as String,
      (json['birthDay'] as num).toDouble(),
    )
      ..email = json['email'] as String?
      ..avatar = json['avatar'] as String?;

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'birthDay': instance.birthDay,
      'email': instance.email,
      'avatar': instance.avatar,
    };
