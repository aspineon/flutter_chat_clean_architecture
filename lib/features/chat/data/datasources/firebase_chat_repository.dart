import 'dart:async';

import 'package:chatr/features/chat/data/models/message_entity_model.dart';
import 'package:chatr/features/chat/domain/entities/message_entity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

class FirebaseChatRepository {
  static final path = "global_messages";
  final Firestore _firestore;

  FirebaseChatRepository(this._firestore);

  Stream<List<MessageEntity>> messages() {
    return _firestore.collection(path).snapshots().map((snapshot) {
      return snapshot.documents.map((doc) {
        return MessageEntityModel(
          id: doc['id'],
          timestamp: doc['timestamp'],
          author: doc['author'],
          text: doc['text'],
        ); 
      }).toList();
    });
  }

  sendMessage(MessageEntityModel message) async {
    return _firestore
        .collection(path)
        .document(message.id)
        .setData(message.toJson());
  }

  deleteMessage(String id) async {
    return _firestore.collection(path).document(id).delete();
  }
}
