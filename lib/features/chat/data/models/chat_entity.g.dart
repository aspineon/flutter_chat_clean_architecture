// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatEntity _$ChatEntityFromJson(Map<String, dynamic> json) {
  return ChatEntity(
    text: json['text'] as String,
    author: json['author'] as String,
    timestamp: json['timestamp'] as int,
  );
}

Map<String, dynamic> _$ChatEntityToJson(ChatEntity instance) =>
    <String, dynamic>{
      'text': instance.text,
      'author': instance.author,
      'timestamp': instance.timestamp,
    };
