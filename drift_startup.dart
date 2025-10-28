import 'dart:isolate' as i0;
import 'package:drift/internal/export_schema.dart' as i1;
import 'package:drift/drift.dart' as i2;
import 'package:drift/src/runtime/query_builder/query_builder.dart' as i3;
void main(List<String> args, i0.SendPort port) {
i1.SchemaExporter.run(args, port, DatabaseAtV1.new);
}
class $UserTableTable extends i2.Table with i2.TableInfo{
@override final i2.GeneratedDatabase attachedDatabase;
final String? _alias;
$UserTableTable(this.attachedDatabase, [this._alias]);
@override
late final i2.GeneratedColumn<int> id = i2.GeneratedColumn<int>('id', aliasedName, false, hasAutoIncrement: true, type: i2.DriftSqlType.int, requiredDuringInsert: false, defaultConstraints: i2.GeneratedColumn.constraintsDependsOnDialect({i2.SqlDialect.sqlite: 'PRIMARY KEY AUTOINCREMENT',
i2.SqlDialect.mysql: 'PRIMARY KEY AUTOINCREMENT',
i2.SqlDialect.postgres: 'PRIMARY KEY AUTOINCREMENT',
i2.SqlDialect.mariadb: 'PRIMARY KEY AUTO_INCREMENT',}));
@override
late final i2.GeneratedColumn<String> name = i2.GeneratedColumn<String>('name', aliasedName, false, type: i2.DriftSqlType.string, requiredDuringInsert: true);
@override
late final i2.GeneratedColumn<String> description = i2.GeneratedColumn<String>('description', aliasedName, false, type: i2.DriftSqlType.string, requiredDuringInsert: true);
@override
late final i2.GeneratedColumn<DateTime> createdAt = i2.GeneratedColumn<DateTime>('created_at', aliasedName, true, type: i2.DriftSqlType.dateTime, requiredDuringInsert: false);
@override
List<i2.GeneratedColumn> get $columns => [id, name, description, createdAt];
@override
String get aliasedName => _alias ?? actualTableName;
@override
 String get actualTableName => $name;
static const String $name = 'user_table';
@override
Set<i2.GeneratedColumn> get $primaryKey => {id};
        @override
        Never map(Map<String, dynamic> data, {String? tablePrefix}) {
          throw UnsupportedError('TableInfo.map in schema verification code');
        }
      
@override
$UserTableTable createAlias(String alias) {
return $UserTableTable(attachedDatabase, alias);}}class $ProjectsTableTable extends i2.Table with i2.TableInfo{
@override final i2.GeneratedDatabase attachedDatabase;
final String? _alias;
$ProjectsTableTable(this.attachedDatabase, [this._alias]);
@override
late final i2.GeneratedColumn<int> id = i2.GeneratedColumn<int>('id', aliasedName, false, hasAutoIncrement: true, type: i2.DriftSqlType.int, requiredDuringInsert: false, defaultConstraints: i2.GeneratedColumn.constraintsDependsOnDialect({i2.SqlDialect.sqlite: 'PRIMARY KEY AUTOINCREMENT',
i2.SqlDialect.mysql: 'PRIMARY KEY AUTOINCREMENT',
i2.SqlDialect.postgres: 'PRIMARY KEY AUTOINCREMENT',
i2.SqlDialect.mariadb: 'PRIMARY KEY AUTO_INCREMENT',}));
@override
late final i2.GeneratedColumn<String> name = i2.GeneratedColumn<String>('name', aliasedName, false, additionalChecks: i2.GeneratedColumn.checkTextLength(minTextLength: 1,maxTextLength: 40), type: i2.DriftSqlType.string, requiredDuringInsert: true);
@override
late final i2.GeneratedColumn<int> userId = i2.GeneratedColumn<int>('user_id', aliasedName, false, type: i2.DriftSqlType.int, requiredDuringInsert: true, defaultConstraints: i2.GeneratedColumn.constraintIsAlways('REFERENCES user_table (id)'));
@override
List<i2.GeneratedColumn> get $columns => [id, name, userId];
@override
String get aliasedName => _alias ?? actualTableName;
@override
 String get actualTableName => $name;
static const String $name = 'projects_table';
@override
Set<i2.GeneratedColumn> get $primaryKey => {id};
        @override
        Never map(Map<String, dynamic> data, {String? tablePrefix}) {
          throw UnsupportedError('TableInfo.map in schema verification code');
        }
      
@override
$ProjectsTableTable createAlias(String alias) {
return $ProjectsTableTable(attachedDatabase, alias);}}class $TaskTableTable extends i2.Table with i2.TableInfo{
@override final i2.GeneratedDatabase attachedDatabase;
final String? _alias;
$TaskTableTable(this.attachedDatabase, [this._alias]);
@override
late final i2.GeneratedColumn<int> id = i2.GeneratedColumn<int>('id', aliasedName, false, hasAutoIncrement: true, type: i2.DriftSqlType.int, requiredDuringInsert: false, defaultConstraints: i2.GeneratedColumn.constraintsDependsOnDialect({i2.SqlDialect.sqlite: 'PRIMARY KEY AUTOINCREMENT',
i2.SqlDialect.mysql: 'PRIMARY KEY AUTOINCREMENT',
i2.SqlDialect.postgres: 'PRIMARY KEY AUTOINCREMENT',
i2.SqlDialect.mariadb: 'PRIMARY KEY AUTO_INCREMENT',}));
@override
late final i2.GeneratedColumn<String> description = i2.GeneratedColumn<String>('description', aliasedName, false, type: i2.DriftSqlType.string, requiredDuringInsert: true, defaultConstraints: i2.GeneratedColumn.constraintIsAlways('UNIQUE'));
@override
late final i2.GeneratedColumn<bool> isCompleate = i2.GeneratedColumn<bool>('is_compleate', aliasedName, false, type: i2.DriftSqlType.bool, requiredDuringInsert: false, defaultConstraints: i2.GeneratedColumn.constraintsDependsOnDialect({i2.SqlDialect.sqlite: 'CHECK ("is_compleate" IN (0, 1))',
i2.SqlDialect.mysql: '',
i2.SqlDialect.postgres: '',
i2.SqlDialect.mariadb: 'CHECK (`is_compleate` IN (0, 1))',}), defaultValue: const i3.Constant(false));
@override
late final i2.GeneratedColumn<int> projectId = i2.GeneratedColumn<int>('project_id', aliasedName, false, type: i2.DriftSqlType.int, requiredDuringInsert: true, defaultConstraints: i2.GeneratedColumn.constraintIsAlways('REFERENCES projects_table (id)'));
@override
List<i2.GeneratedColumn> get $columns => [id, description, isCompleate, projectId];
@override
String get aliasedName => _alias ?? actualTableName;
@override
 String get actualTableName => $name;
static const String $name = 'task_table';
@override
Set<i2.GeneratedColumn> get $primaryKey => {id};
        @override
        Never map(Map<String, dynamic> data, {String? tablePrefix}) {
          throw UnsupportedError('TableInfo.map in schema verification code');
        }
      
@override
$TaskTableTable createAlias(String alias) {
return $TaskTableTable(attachedDatabase, alias);}}class $AssignedTaskTableTable extends i2.Table with i2.TableInfo{
@override final i2.GeneratedDatabase attachedDatabase;
final String? _alias;
$AssignedTaskTableTable(this.attachedDatabase, [this._alias]);
@override
late final i2.GeneratedColumn<int> id = i2.GeneratedColumn<int>('id', aliasedName, false, hasAutoIncrement: true, type: i2.DriftSqlType.int, requiredDuringInsert: false, defaultConstraints: i2.GeneratedColumn.constraintsDependsOnDialect({i2.SqlDialect.sqlite: 'PRIMARY KEY AUTOINCREMENT',
i2.SqlDialect.mysql: 'PRIMARY KEY AUTOINCREMENT',
i2.SqlDialect.postgres: 'PRIMARY KEY AUTOINCREMENT',
i2.SqlDialect.mariadb: 'PRIMARY KEY AUTO_INCREMENT',}));
@override
late final i2.GeneratedColumn<int> userId = i2.GeneratedColumn<int>('user_id', aliasedName, false, type: i2.DriftSqlType.int, requiredDuringInsert: true, defaultConstraints: i2.GeneratedColumn.constraintIsAlways('REFERENCES user_table (id)'));
@override
late final i2.GeneratedColumn<int> taskId = i2.GeneratedColumn<int>('task_id', aliasedName, false, type: i2.DriftSqlType.int, requiredDuringInsert: true, defaultConstraints: i2.GeneratedColumn.constraintIsAlways('REFERENCES task_table (id)'));
@override
List<i2.GeneratedColumn> get $columns => [id, userId, taskId];
@override
String get aliasedName => _alias ?? actualTableName;
@override
 String get actualTableName => $name;
static const String $name = 'assigned_task_table';
@override
Set<i2.GeneratedColumn> get $primaryKey => {id};
        @override
        Never map(Map<String, dynamic> data, {String? tablePrefix}) {
          throw UnsupportedError('TableInfo.map in schema verification code');
        }
      
@override
$AssignedTaskTableTable createAlias(String alias) {
return $AssignedTaskTableTable(attachedDatabase, alias);}}class DatabaseAtV1 extends i2.GeneratedDatabase{
DatabaseAtV1(i2.QueryExecutor e): super(e);
late final $UserTableTable userTable = $UserTableTable(this);
late final $ProjectsTableTable projectsTable = $ProjectsTableTable(this);
late final $TaskTableTable taskTable = $TaskTableTable(this);
late final $AssignedTaskTableTable assignedTaskTable = $AssignedTaskTableTable(this);
@override
Iterable<i2.TableInfo<i2.Table, Object?>> get allTables => allSchemaEntities.whereType<i2.TableInfo<i2.Table, Object?>>();
@override
List<i2.DatabaseSchemaEntity> get allSchemaEntities => [userTable, projectsTable, taskTable, assignedTaskTable];
@override
int get schemaVersion => 1;
}
