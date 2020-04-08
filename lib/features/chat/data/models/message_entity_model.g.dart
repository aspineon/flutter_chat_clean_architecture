// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_entity_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MessageEntityModel _$MessageEntityModelFromJson(Map<String, dynamic> json) {
  return MessageEntityModel(
    id: json['id'] as String,
    text: json['text'] as String,
    author: json['author'] as String,
    timestamp: json['timestamp'] as int,
  );
}

Map<String, dynamic> _$MessageEntityModelToJson(MessageEntityModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'text': instance.text,
      'author': instance.author,
      'timestamp': instance.timestamp,
    };
