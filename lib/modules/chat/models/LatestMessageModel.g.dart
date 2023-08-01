// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'LatestMessageModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LatestMessageModel _$LatestMessageModelFromJson(Map json) => LatestMessageModel(
      UserModel.fromJson(Map<String, dynamic>.from(json['userModel'] as Map)),
      json['latestMessage'] as String,
      (json['timestamp'] as num).toDouble(),
    );

Map<String, dynamic> _$LatestMessageModelToJson(LatestMessageModel instance) =>
    <String, dynamic>{
      'userModel': instance.userModel.toJson(),
      'latestMessage': instance.latestMessage,
      'timestamp': instance.timestamp,
    };
