// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'LatestMessage.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LatestMessage _$LatestMessageFromJson(Map json) => LatestMessage(
      json['userId'] as String,
      json['latestMessage'] as String,
      (json['timestamp'] as num).toDouble(),
    );

Map<String, dynamic> _$LatestMessageToJson(LatestMessage instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'latestMessage': instance.latestMessage,
      'timestamp': instance.timestamp,
    };
