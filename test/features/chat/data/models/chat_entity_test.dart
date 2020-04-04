import 'package:chatr/features/chat/data/models/chat_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ChatEntity test', () {
    test('not equal', () async {
      final one = ChatEntity(author: "Me", text: "example", timestamp: 1122);
      final two = ChatEntity(author: "Me", text: "example", timestamp: 1122);

      expect(one == two, equals(false));
      expect(one != two, equals(true));
      expect(one.text, equals(two.text));
      expect(one.timestamp, equals(two.timestamp));
      expect(one.author, equals(two.author));
    });
  });
}
