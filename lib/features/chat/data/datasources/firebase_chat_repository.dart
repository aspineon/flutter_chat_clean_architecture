import 'package:chatr/features/chat/data/models/message_entity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseChatRepository {
  static final path = "global_messages";
  final Firestore _firestore;

  FirebaseChatRepository(this._firestore);

  Stream<List<MessageEntity>> messages() {
    return _firestore.collection(path).snapshots().map((snapshot) {
      return snapshot.documents.map((doc) {
        return MessageEntity(
          timestamp: doc['timestamp'],
          author: doc['author'],
          text: doc['text'],
        );
      }).toList();
    });
  }

  void sendMessage(MessageEntity message) {}

  deleteMessage(List<String> list) {}
}
