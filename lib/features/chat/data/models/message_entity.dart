import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:shortid/shortid.dart';

part 'message_entity.g.dart';

@JsonSerializable()
class MessageEntity extends Equatable {
  final String id;
  final String text;
  final String author;
  final int timestamp;

  MessageEntity({
    @required this.id,
    @required this.text,
    @required this.author,
    @required this.timestamp,
  });

  static String generateId() => shortid.generate();

  @override
  List<Object> get props => [id, text, author, timestamp];

  factory MessageEntity.fromJson(Map<String, dynamic> json) =>
      _$MessageEntityFromJson(json);
  Map<String, dynamic> toJson() => _$MessageEntityToJson(this);
}
