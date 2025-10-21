
import 'package:drift/drift.dart';
import 'package:drift_clear_learn/data/tables/projects_table.dart';

class TaskTable extends Table{
  IntColumn get id => integer().autoIncrement()();
  TextColumn get description => text().unique()();
  BoolColumn get isCompleate => boolean().withDefault(const Constant(false))();
  IntColumn get projectId => integer().references(ProjectsTable, #id)();
}