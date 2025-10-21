part of '../database/project_database.dart';

@DriftAccessor(tables: [TaskTable])
class TaskDao extends DatabaseAccessor<ProjectDatabase> with _$TaskDaoMixin{
  TaskDao(super.database);

  Future<void> putTask() async {
    final now = await DateTime.now();

    into(taskTable).insert(TaskTableCompanion.insert(description: 'this simple task ${now.millisecond}', projectId: 1));
  }

  Future<List<TaskTableData>> getAll() => select(taskTable).get();
}