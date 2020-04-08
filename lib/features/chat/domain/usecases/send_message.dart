import 'package:chatr/core/error/failures.dart';
import 'package:chatr/core/usecases/usecase.dart';
import 'package:chatr/features/chat/domain/entities/message_entity.dart';
import 'package:chatr/features/chat/domain/repositories/chat_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class SendMessage implements UseCase<MessageEntity, Null> {
  final ChatRepository repository;

  SendMessage(this.repository);

  @override
  Future<Either<Failure, Null>> call(Params params) async {
    return await repository.sendMessage(params.message);
  }
}

class Params extends Equatable {
  final MessageEntity message;

  Params({@required this.message});

  @override
  List<Object> get props => [message];
}