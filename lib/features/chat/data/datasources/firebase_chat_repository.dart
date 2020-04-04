import 'package:chatr/features/chat/data/models/chat_entity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseChatRepository {
  static final path = "global_messages";
  final Firestore _firestore;

  FirebaseChatRepository(this._firestore);

  Stream<List<ChatEntity>> messages() {
    return _firestore.collection(path).snapshots().map((snapshot) {
      return snapshot.documents.map((doc) {
        return ChatEntity(
          timestamp: doc['timestamp'],
          author: doc['author'],
          text: doc['text'],
        );
      }).toList();
    });
  }

  void sendMessage(ChatEntity message) {}

  deleteMessage(List<String> list) {}
}
