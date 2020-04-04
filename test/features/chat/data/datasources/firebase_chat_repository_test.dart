import 'dart:async';

import 'package:chatr/features/chat/data/datasources/firebase_chat_repository.dart';
import 'package:chatr/features/chat/data/models/chat_entity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

void main() {
  ChatEntity message;
  setUp(() {
    message = ChatEntity(author: "Me", text: "example", timestamp: 1122);
  });

  group('FirebaseReactiveTodosRepository', () {
    test('should send chat message to firestore', () {
      final firestore = MockFirestore();
      final collection = MockCollectionReference();
      final document = MockDocumentReference();
      final repository = FirebaseChatRepository(firestore);

      when(firestore.collection(FirebaseChatRepository.path))
          .thenReturn(collection);

      when(collection.document(message.text)).thenReturn(document);

      repository.sendMessage(message);

      verify(document.setData(message.toJson()));
    });

    test('should listen for updates to the collection', () {
      final firestore = MockFirestore();
      final collection = MockCollectionReference();
      final snapshot = MockQuerySnapshot();
      final snapshots = Stream.fromIterable([snapshot]);
      final document = MockDocumentSnapshot(message.toJson());
      final repository = FirebaseChatRepository(firestore);

      when(firestore.collection(FirebaseChatRepository.path))
          .thenReturn(collection);
      when(collection.snapshots()).thenAnswer((_) => snapshots);
      when(snapshot.documents).thenReturn([document]);
      when(document.documentID).thenReturn(message.text);

      expect(repository.messages(), emits([message]));
    });

    test('should delete todos on firestore', () async {
      final todoA = 'A';
      final todoB = 'B';
      final firestore = MockFirestore();
      final collection = MockCollectionReference();
      final documentA = MockDocumentReference();
      final documentB = MockDocumentReference();
      final repository = FirebaseChatRepository(firestore);

      when(firestore.collection(FirebaseChatRepository.path))
          .thenReturn(collection);
      when(collection.document(todoA)).thenReturn(documentA);
      when(collection.document(todoB)).thenReturn(documentB);
      when(documentA.delete()).thenAnswer((_) => Future.value());
      when(documentB.delete()).thenAnswer((_) => Future.value());

      await repository.deleteTodo([todoA, todoB]);

      verify(documentA.delete());
      verify(documentB.delete());
    });
  });
}

class MockFirestore extends Mock implements Firestore {}

class MockCollectionReference extends Mock implements CollectionReference {}

class MockDocumentSnapshot extends Mock implements DocumentSnapshot {
  @override
  final Map<String, dynamic> data;

  MockDocumentSnapshot([this.data]);

  @override
  dynamic operator [](String key) => data[key];
}

class MockDocumentReference extends Mock implements DocumentReference {}

class MockQuerySnapshot extends Mock implements QuerySnapshot {}
