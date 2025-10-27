import 'dart:async';
import 'package:drift_clear_learn/data/database/project_database.dart';
import 'package:rxdart/rxdart.dart';


class DatabaseStreamService {
  final ProjectDatabase _database;

  DatabaseStreamService(this._database);

  Stream<List<UserTableData>> watchUsers() {
    return _database.userDao.watchAll();
  }

  Stream<List<ProjectsTableData>> watchProjects() {
    return _database.projectsDao.watchAll();
  }

  Stream<List<TaskTableData>> watchTasks() {
    return _database.taskDao.watchAll();
  }

  Stream<void> watchAllChanges() {
    return Rx.combineLatest3(
      watchUsers(),
      watchProjects(),
      watchTasks(),
      (_, __, ___) {},
    );
  }

  Stream<UserTableData?> watchUserById(int userId) {
    return _database.userDao.watchAll().map(
          (users) => users.where((user) => user.id == userId).firstOrNull,
        );
  }

  Stream<List<ProjectsTableData>> watchProjectsByUserId(int userId) {
    return _database.projectsDao
        .select(_database.projectsTable)
        .watch()
        .map((projects) => projects.where((p) => p.userId == userId).toList());
  }

  Stream<List<TaskTableData>> watchTasksByProjectId(int projectId) {
    return _database.taskDao
        .select(_database.taskTable)
        .watch()
        .map((tasks) => tasks.where((t) => t.projectId == projectId).toList());
  }
}

