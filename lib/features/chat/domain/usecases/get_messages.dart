import 'package:chatr/core/usecases/usecase.dart';
import 'package:chatr/features/chat/domain/entities/message_entity.dart';
import 'package:chatr/features/chat/domain/repositories/chat_repository.dart';

class GetMessages implements UseCaseStream<List<MessageEntity>, NoParams> {
  final ChatRepository repository;

  GetMessages(this.repository);

  @override
  Stream<List<MessageEntity>> call(NoParams params) {
    return repository.getMessages();
  }

}
