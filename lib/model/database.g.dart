// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class Message extends DataClass implements Insertable<Message> {
  final int id;
  final String message;
  Message({@required this.id, @required this.message});
  factory Message.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return Message(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      message:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}message']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || message != null) {
      map['message'] = Variable<String>(message);
    }
    return map;
  }

  MessagesCompanion toCompanion(bool nullToAbsent) {
    return MessagesCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      message: message == null && nullToAbsent
          ? const Value.absent()
          : Value(message),
    );
  }

  factory Message.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Message(
      id: serializer.fromJson<int>(json['id']),
      message: serializer.fromJson<String>(json['message']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'message': serializer.toJson<String>(message),
    };
  }

  Message copyWith({int id, String message}) => Message(
        id: id ?? this.id,
        message: message ?? this.message,
      );
  @override
  String toString() {
    return (StringBuffer('Message(')
          ..write('id: $id, ')
          ..write('message: $message')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(id.hashCode, message.hashCode));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Message &&
          other.id == this.id &&
          other.message == this.message);
}

class MessagesCompanion extends UpdateCompanion<Message> {
  final Value<int> id;
  final Value<String> message;
  const MessagesCompanion({
    this.id = const Value.absent(),
    this.message = const Value.absent(),
  });
  MessagesCompanion.insert({
    this.id = const Value.absent(),
    @required String message,
  }) : message = Value(message);
  static Insertable<Message> custom({
    Expression<int> id,
    Expression<String> message,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (message != null) 'message': message,
    });
  }

  MessagesCompanion copyWith({Value<int> id, Value<String> message}) {
    return MessagesCompanion(
      id: id ?? this.id,
      message: message ?? this.message,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (message.present) {
      map['message'] = Variable<String>(message.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MessagesCompanion(')
          ..write('id: $id, ')
          ..write('message: $message')
          ..write(')'))
        .toString();
  }
}

class $MessagesTable extends Messages with TableInfo<$MessagesTable, Message> {
  final GeneratedDatabase _db;
  final String _alias;
  $MessagesTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _messageMeta = const VerificationMeta('message');
  GeneratedTextColumn _message;
  @override
  GeneratedTextColumn get message => _message ??= _constructMessage();
  GeneratedTextColumn _constructMessage() {
    return GeneratedTextColumn(
      'message',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [id, message];
  @override
  $MessagesTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'messages';
  @override
  final String actualTableName = 'messages';
  @override
  VerificationContext validateIntegrity(Insertable<Message> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('message')) {
      context.handle(_messageMeta,
          message.isAcceptableOrUnknown(data['message'], _messageMeta));
    } else if (isInserting) {
      context.missing(_messageMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Message map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Message.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $MessagesTable createAlias(String alias) {
    return $MessagesTable(_db, alias);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $MessagesTable _messages;
  $MessagesTable get messages => _messages ??= $MessagesTable(this);
  Selectable<Message> _getAllMessages() {
    return customSelect('SELECT * FROM messages',
        variables: [], readsFrom: {messages}).map(messages.mapFromRow);
  }

  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [messages];
}
