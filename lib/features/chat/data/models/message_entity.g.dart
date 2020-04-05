// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MessageEntity _$MessageEntityFromJson(Map<String, dynamic> json) {
  return MessageEntity(
    id: json['id'] as String,
    text: json['text'] as String,
    author: json['author'] as String,
    timestamp: json['timestamp'] as int,
  );
}

Map<String, dynamic> _$MessageEntityToJson(MessageEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'text': instance.text,
      'author': instance.author,
      'timestamp': instance.timestamp,
    };
