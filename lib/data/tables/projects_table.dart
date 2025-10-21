
import 'package:drift/drift.dart';
import 'package:drift_clear_learn/data/tables/user_table.dart';

class ProjectsTable extends Table{
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().withLength(max: 40, min: 1).named('name')();
  IntColumn get userId => integer().references(UserTable, #id)(); //one - to many
}