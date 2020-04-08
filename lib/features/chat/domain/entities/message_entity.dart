import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class MessageEntity extends Equatable {
   final String id;
  final String text;
  final String author;
  final int timestamp;

  MessageEntity({
    @required this.id,
    @required this.text,
    @required this.author,
    @required this.timestamp, int number,
  });

 @override
  List<Object> get props => [id, text, author, timestamp];
}