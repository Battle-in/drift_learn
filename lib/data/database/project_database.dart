import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';

// Import your tables and DAOs
import '../tables/user_table.dart';
import '../tables/projects_table.dart';
import '../tables/task_table.dart';
import '../tables/assigned_task_table.dart';

part '../dao/user_dao.dart';
part '../dao/task_dao.dart';
part '../dao/project_dao.dart';

// Only this part directive is correct (for generated code)
part 'project_database.g.dart';

@DriftDatabase(
  tables: [UserTable, ProjectsTable, TaskTable, AssignedTaskTable],
  daos: [UserDao, TaskDao, ProjectsDao],
)
class ProjectDatabase extends _$ProjectDatabase {
  ProjectDatabase([QueryExecutor? executor])
      : super(executor ?? LazyDatabase(() async {
          final dbFolder = await getApplicationDocumentsDirectory();
          final file = File('${dbFolder.path}/db.sqlite');
          return NativeDatabase(file);
        }));

  @override
  int get schemaVersion => 2;

  @override
MigrationStrategy get migration => MigrationStrategy(
  onCreate: (m) async {
    await m.createAll();
  },
  onUpgrade: (m, from, to) async {
    // Миграция с версии 1 на 2: добавление email
    if (from == 1) {
      await m.addColumn(taskTable, taskTable.isCompleate);
    }
  },
  beforeOpen: (details) async {
    await customStatement('PRAGMA foreign_keys = ON');
    await customStatement('PRAGMA journal_mode = WAL');
  },
);
}