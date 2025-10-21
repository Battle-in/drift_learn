import 'package:drift/drift.dart';

class UserTable extends Table{
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().named('name')();
  TextColumn get description => text().named('description')();
  DateTimeColumn get createdAt => dateTime().nullable()();
}