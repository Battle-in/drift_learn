part of '../database/project_database.dart';

@DriftAccessor(tables: [UserTable])
class UserDao extends DatabaseAccessor<ProjectDatabase> with _$UserDaoMixin{
  UserDao(super.database);

  Future<List<UserTableData>> getAll() => select(userTable).get();
  Future<void> putUser() => into(userTable).insert(UserTableCompanion.insert(name: 'Somename', description: 'Descriprion'));
}