part of '../database/project_database.dart';

@DriftAccessor(tables: [ProjectsTable])
class ProjectsDao extends DatabaseAccessor<ProjectDatabase> with _$ProjectsDaoMixin {
  ProjectsDao(super.database);

  // можно вместо ProjectsTableCompanion.insert вставить ProjectsTableData
  Future<void> putProject() => into(projectsTable).insert(ProjectsTableCompanion.insert(name: 'value',  userId: 1));

  Future<List<ProjectsTableData>> getAll() => select(projectsTable).get();
}
