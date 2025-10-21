

//Many to Many
import 'package:drift/drift.dart';
import 'package:drift_clear_learn/data/tables/task_table.dart';
import 'package:drift_clear_learn/data/tables/user_table.dart';

class AssignedTaskTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get userId => integer().references(UserTable, #id)();
  IntColumn get taskId => integer().references(TaskTable, #id)();
}