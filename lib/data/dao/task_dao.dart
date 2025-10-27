part of '../database/project_database.dart';

@DriftAccessor(tables: [TaskTable])
class TaskDao extends DatabaseAccessor<ProjectDatabase> with _$TaskDaoMixin{
  TaskDao(super.database);

  Future<void> putTask() async {
    final now = DateTime.now();

    await into(taskTable).
      insert(TaskTableCompanion.insert(description: 
        'this simple task ${now.millisecond}', projectId: 1));
  }

  Future<List<TaskTableData>> getAll() async => await select(taskTable).get();

  Stream<List<TaskTableData>> watchAll() => select(taskTable).watch();
}