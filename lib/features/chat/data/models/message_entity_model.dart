import 'package:chatr/features/chat/domain/entities/message_entity.dart';
import 'package:meta/meta.dart';
import 'package:json_annotation/json_annotation.dart';

part 'message_entity_model.g.dart';

@JsonSerializable()
class MessageEntityModel extends MessageEntity {
  final String id;
  final String text;
  final String author;
  final int timestamp;

  MessageEntityModel({
    @required this.id,
    @required this.text,
    @required this.author,
    @required this.timestamp,
  });

  factory MessageEntityModel.fromJson(Map<String, dynamic> json) =>
      _$MessageEntityModelFromJson(json);
  Map<String, dynamic> toJson() => _$MessageEntityModelToJson(this);
}
