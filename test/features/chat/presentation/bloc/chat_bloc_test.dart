import 'package:chatr/features/chat/domain/usecases/delete_message.dart';
import 'package:chatr/features/chat/domain/usecases/get_messages.dart';
import 'package:chatr/features/chat/domain/usecases/send_message.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockGetMessages extends Mock implements GetMessages{}
class MockDeleteMessage extends Mock implements DeleteMessage{}
class MockSendMessage extends Mock implements SendMessage{}

void main() {
  ChatBloc bloc;
  MockDeleteMessage mockDeleteMessage;
  MockSendMessage mockSendMessage;
  MockGetMessages mockGetMessages;
  
  setUp(() {
    mockGetMessages = MockGetMessages();
    mockSendMessage = MockSendMessage();
    mockDeleteMessage = MockDeleteMessage();

    bloc = ChatBloc(
      send: mockSendMessage,
      getAll: mockGetMessages,
      delete: mockDeleteMessage,
    );
  });
}