import 'package:chatr/features/chat/domain/entities/message_entity.dart';
import 'package:chatr/features/chat/domain/repositories/chat_repository.dart';
import 'package:chatr/features/chat/domain/usecases/delete_message.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockChatRepository extends Mock
    implements ChatRepository {}

void main() {
  DeleteMessage usecase;
  MockChatRepository mockChatRepository;

  setUp(() {
    mockChatRepository = MockChatRepository();
    usecase = DeleteMessage(mockChatRepository);
  });

  final id = "asdasd";
  final message = MessageEntity(id: id, author: "abc" ,timestamp: 1, text: 'test');

  test(
    'delete message from the repository',
    () async {
      // arrange
      when(mockChatRepository.deleteMessage(any))
          .thenAnswer((_) async => null);
      // act
      final result = await usecase(Params(id: id));
      // assert
      expect(result, null);
      verify(mockChatRepository.deleteMessage(id));
      verifyNoMoreInteractions(mockChatRepository);
    },
  );
}
