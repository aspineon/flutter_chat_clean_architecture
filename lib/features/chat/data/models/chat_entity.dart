import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:shortid/shortid.dart';

part 'chat_entity.g.dart';

@JsonSerializable()
class ChatEntity extends Equatable {
  final String id = shortid.generate();
  final String text;
  final String author;
  final int timestamp;

  ChatEntity({
    @required this.text,
    @required this.author,
    @required this.timestamp,
  });

  @override
  List<Object> get props => [id, text, author, timestamp];

  factory ChatEntity.fromJson(Map<String, dynamic> json) =>
      _$ChatEntityFromJson(json);
  Map<String, dynamic> toJson() => _$ChatEntityToJson(this);
}
