import 'package:moor_flutter/moor_flutter.dart';

class Messages extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get message => text()();
}
