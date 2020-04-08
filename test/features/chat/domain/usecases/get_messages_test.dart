import 'package:chatr/core/usecases/usecase.dart';
import 'package:chatr/features/chat/domain/entities/message_entity.dart';
import 'package:chatr/features/chat/domain/repositories/chat_repository.dart';
import 'package:chatr/features/chat/domain/usecases/get_messages.dart';
import 'package:chatr/features/chat/domain/usecases/send_message.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockChatRepository extends Mock
    implements ChatRepository {}

void main() {
  GetMessages usecase;
  MockChatRepository mockChatRepository;

  setUp(() {
    mockChatRepository = MockChatRepository();
    usecase = GetMessages(mockChatRepository);
  });

  final message = MessageEntity(id: "abc", author: "abc" ,timestamp: 1, text: 'test');
  final message2 = MessageEntity(id: "abcc", author: "abc2" ,timestamp: 12, text: 'test222');
  final list = List<MessageEntity>()..add(message)..add(message2);
  Iterable<List<MessageEntity>> iterable = [list];
  final streamOf = Stream.fromIterable(iterable);
  test(
    'get messages from the repository',
    () async {
      // arrange
      when(mockChatRepository.getMessages())
          .thenAnswer((_) => streamOf);
      // act
      final result = usecase(NoParams());
      // assert
      expect(result, streamOf);
      verify(mockChatRepository.getMessages());
      verifyNoMoreInteractions(mockChatRepository);
    },
  );
}
