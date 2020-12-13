import 'package:moor_flutter/moor_flutter.dart';
import 'message.dart';

part 'database.g.dart';

@UseMoor(
    tables: [Messages], queries: {'_getAllMessages': 'SELECT * FROM messages'})
class AppDatabase extends _$AppDatabase {
  AppDatabase()
      : super(FlutterQueryExecutor.inDatabaseFolder(path: "message_db.sqlite"));

  @override
  int get schemaVersion => 1;

  Future<List<Message>> getAllMessages() => select(messages).get();
  Stream<List<Message>> getMessage() => select(messages).watch();
  Future insertMessage(Message message) => into(messages).insert(message);
}
