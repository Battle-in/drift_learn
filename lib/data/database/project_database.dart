import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';

import '../tables/user_table.dart';
import '../tables/projects_table.dart';
import '../tables/task_table.dart';
import '../tables/assigned_task_table.dart';

import 'project_database.steps.dart';

part '../dao/user_dao.dart';
part '../dao/task_dao.dart';
part '../dao/project_dao.dart';

part 'project_database.g.dart';

@DriftDatabase(
  tables: [UserTable, ProjectsTable, TaskTable, AssignedTaskTable],
  daos: [UserDao, TaskDao, ProjectsDao],
)
class ProjectDatabase extends _$ProjectDatabase {
  // singleton чтобы не тянуть DI в учебный проект
  static ProjectDatabase? _instance;

  ProjectDatabase._internal(QueryExecutor executor) : super(executor);

  factory ProjectDatabase([QueryExecutor? executor]) {
    _instance ??= ProjectDatabase._internal(
        executor ?? LazyDatabase(() async {
          final dbFolder = await getApplicationDocumentsDirectory();
          final file = File('${dbFolder.path}/db.sqlite');
          return NativeDatabase(file);
        }),
      );
    return _instance!;
  }

  @override
  int get schemaVersion => 3;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (m) async {
      await m.createAll();
    },
    onUpgrade: stepByStep(
      from1To2: (m, schema) async {
        await m.addColumn(taskTable, taskTable.isCompleate);
      },
      from2To3: (Migrator m, Schema3 schema) async {
        // TODO: добавить миграцию на 3
      },
    ),
    beforeOpen: (details) async {
      await customStatement('PRAGMA foreign_keys = ON');
      await customStatement('PRAGMA journal_mode = WAL');
    },
  );
}