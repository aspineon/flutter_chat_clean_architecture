import 'package:chatr/core/error/failures.dart';
import 'package:chatr/core/usecases/usecase.dart';
import 'package:chatr/features/chat/domain/repositories/chat_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class DeleteMessage implements UseCase<Null, Params> {
  final ChatRepository repository;

  DeleteMessage(this.repository);

  @override
  Future<Either<Failure, Null>> call(Params params) async {
    return await repository.deleteMessage(params.id);
  }
}

class Params extends Equatable {
  final String id;

  Params({@required this.id});

  @override
  List<Object> get props => [id];
}