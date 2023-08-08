// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Message _$MessageFromJson(Map json) => Message(
      json['userId'] as String,
      json['messageContent'] as String,
      (json['timestamp'] as num).toDouble(),
    );

Map<String, dynamic> _$MessageToJson(Message instance) => <String, dynamic>{
      'userId': instance.userId,
      'messageContent': instance.messageContent,
      'timestamp': instance.timestamp,
    };
