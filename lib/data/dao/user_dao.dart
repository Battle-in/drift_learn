part of '../database/project_database.dart';

@DriftAccessor(tables: [UserTable])
class UserDao extends DatabaseAccessor<ProjectDatabase> with _$UserDaoMixin{
  UserDao(super.database);

  Future<List<UserTableData>> getAll() async => await select(userTable).get();

  Future<List<Map<String, dynamic>>> getUserWithProjectsAndTasksJson() async {
    final results = await customSelect('''
      SELECT DISTINCT
        u.id as user_id,
        u.name as user_name,
        u.description as user_description,
        u.created_at as user_created_at,
        p.id as project_id,
        p.name as project_name,
        p.user_id as project_user_id,
        t.id as task_id,
        t.description as task_description,
        t.is_compleate as task_is_complete,
        t.project_id as task_project_id
      FROM user_table u
      LEFT JOIN projects_table p ON u.id = p.user_id
      LEFT JOIN task_table t ON p.id = t.project_id
      ORDER BY u.name, p.name, t.id
    ''').get();
    
    return results.map((row) => row.data).toList();
  }

    Future<void> putUser() async => await into(userTable).
    insert(UserTableCompanion.insert(
      name: 'Somename', description: 'Descriprion'));
}