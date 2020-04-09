import 'package:chatr/features/chat/domain/entities/message_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class ChatEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class DeleteMessageEvent extends ChatEvent {
  final MessageEntity messageEntity;

  DeleteMessageEvent(this.messageEntity);

  @override
  List<Object> get props => [messageEntity];
}

class SendMessageEvent extends ChatEvent {
  final MessageEntity messageEntity;
  SendMessageEvent(this.messageEntity);

  @override
  List<Object> get props => [messageEntity];
}

class GetMessagesEvent extends ChatEvent {}

