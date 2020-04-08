import 'package:chatr/features/chat/domain/entities/message_entity.dart';

abstract class ChatRepository {
  Stream<List<MessageEntity>> getMessages();
  Future sendMessage(MessageEntity message);
  Future deleteMessage(String id);
}