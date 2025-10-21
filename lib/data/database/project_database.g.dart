// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_database.dart';

// ignore_for_file: type=lint
class $UserTableTable extends UserTable
    with TableInfo<$UserTableTable, UserTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UserTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [id, name, description, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'user_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<UserTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  UserTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UserTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      ),
    );
  }

  @override
  $UserTableTable createAlias(String alias) {
    return $UserTableTable(attachedDatabase, alias);
  }
}

class UserTableData extends DataClass implements Insertable<UserTableData> {
  final int id;
  final String name;
  final String description;
  final DateTime? createdAt;
  const UserTableData({
    required this.id,
    required this.name,
    required this.description,
    this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['description'] = Variable<String>(description);
    if (!nullToAbsent || createdAt != null) {
      map['created_at'] = Variable<DateTime>(createdAt);
    }
    return map;
  }

  UserTableCompanion toCompanion(bool nullToAbsent) {
    return UserTableCompanion(
      id: Value(id),
      name: Value(name),
      description: Value(description),
      createdAt: createdAt == null && nullToAbsent
          ? const Value.absent()
          : Value(createdAt),
    );
  }

  factory UserTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UserTableData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String>(json['description']),
      createdAt: serializer.fromJson<DateTime?>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String>(description),
      'createdAt': serializer.toJson<DateTime?>(createdAt),
    };
  }

  UserTableData copyWith({
    int? id,
    String? name,
    String? description,
    Value<DateTime?> createdAt = const Value.absent(),
  }) => UserTableData(
    id: id ?? this.id,
    name: name ?? this.name,
    description: description ?? this.description,
    createdAt: createdAt.present ? createdAt.value : this.createdAt,
  );
  UserTableData copyWithCompanion(UserTableCompanion data) {
    return UserTableData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      description: data.description.present
          ? data.description.value
          : this.description,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('UserTableData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, description, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserTableData &&
          other.id == this.id &&
          other.name == this.name &&
          other.description == this.description &&
          other.createdAt == this.createdAt);
}

class UserTableCompanion extends UpdateCompanion<UserTableData> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> description;
  final Value<DateTime?> createdAt;
  const UserTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  UserTableCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String description,
    this.createdAt = const Value.absent(),
  }) : name = Value(name),
       description = Value(description);
  static Insertable<UserTableData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? description,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  UserTableCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<String>? description,
    Value<DateTime?>? createdAt,
  }) {
    return UserTableCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UserTableCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $ProjectsTableTable extends ProjectsTable
    with TableInfo<$ProjectsTableTable, ProjectsTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProjectsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 40,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<int> userId = GeneratedColumn<int>(
    'user_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES user_table (id)',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [id, name, userId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'projects_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<ProjectsTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('user_id')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta),
      );
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ProjectsTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ProjectsTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      userId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}user_id'],
      )!,
    );
  }

  @override
  $ProjectsTableTable createAlias(String alias) {
    return $ProjectsTableTable(attachedDatabase, alias);
  }
}

class ProjectsTableData extends DataClass
    implements Insertable<ProjectsTableData> {
  final int id;
  final String name;
  final int userId;
  const ProjectsTableData({
    required this.id,
    required this.name,
    required this.userId,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['user_id'] = Variable<int>(userId);
    return map;
  }

  ProjectsTableCompanion toCompanion(bool nullToAbsent) {
    return ProjectsTableCompanion(
      id: Value(id),
      name: Value(name),
      userId: Value(userId),
    );
  }

  factory ProjectsTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ProjectsTableData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      userId: serializer.fromJson<int>(json['userId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'userId': serializer.toJson<int>(userId),
    };
  }

  ProjectsTableData copyWith({int? id, String? name, int? userId}) =>
      ProjectsTableData(
        id: id ?? this.id,
        name: name ?? this.name,
        userId: userId ?? this.userId,
      );
  ProjectsTableData copyWithCompanion(ProjectsTableCompanion data) {
    return ProjectsTableData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      userId: data.userId.present ? data.userId.value : this.userId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ProjectsTableData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('userId: $userId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, userId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ProjectsTableData &&
          other.id == this.id &&
          other.name == this.name &&
          other.userId == this.userId);
}

class ProjectsTableCompanion extends UpdateCompanion<ProjectsTableData> {
  final Value<int> id;
  final Value<String> name;
  final Value<int> userId;
  const ProjectsTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.userId = const Value.absent(),
  });
  ProjectsTableCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required int userId,
  }) : name = Value(name),
       userId = Value(userId);
  static Insertable<ProjectsTableData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<int>? userId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (userId != null) 'user_id': userId,
    });
  }

  ProjectsTableCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<int>? userId,
  }) {
    return ProjectsTableCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      userId: userId ?? this.userId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<int>(userId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProjectsTableCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('userId: $userId')
          ..write(')'))
        .toString();
  }
}

class $TaskTableTable extends TaskTable
    with TableInfo<$TaskTableTable, TaskTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TaskTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _isCompleateMeta = const VerificationMeta(
    'isCompleate',
  );
  @override
  late final GeneratedColumn<bool> isCompleate = GeneratedColumn<bool>(
    'is_compleate',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_compleate" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _projectIdMeta = const VerificationMeta(
    'projectId',
  );
  @override
  late final GeneratedColumn<int> projectId = GeneratedColumn<int>(
    'project_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES projects_table (id)',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    description,
    isCompleate,
    projectId,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'task_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<TaskTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('is_compleate')) {
      context.handle(
        _isCompleateMeta,
        isCompleate.isAcceptableOrUnknown(
          data['is_compleate']!,
          _isCompleateMeta,
        ),
      );
    }
    if (data.containsKey('project_id')) {
      context.handle(
        _projectIdMeta,
        projectId.isAcceptableOrUnknown(data['project_id']!, _projectIdMeta),
      );
    } else if (isInserting) {
      context.missing(_projectIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TaskTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TaskTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      )!,
      isCompleate: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_compleate'],
      )!,
      projectId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}project_id'],
      )!,
    );
  }

  @override
  $TaskTableTable createAlias(String alias) {
    return $TaskTableTable(attachedDatabase, alias);
  }
}

class TaskTableData extends DataClass implements Insertable<TaskTableData> {
  final int id;
  final String description;
  final bool isCompleate;
  final int projectId;
  const TaskTableData({
    required this.id,
    required this.description,
    required this.isCompleate,
    required this.projectId,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['description'] = Variable<String>(description);
    map['is_compleate'] = Variable<bool>(isCompleate);
    map['project_id'] = Variable<int>(projectId);
    return map;
  }

  TaskTableCompanion toCompanion(bool nullToAbsent) {
    return TaskTableCompanion(
      id: Value(id),
      description: Value(description),
      isCompleate: Value(isCompleate),
      projectId: Value(projectId),
    );
  }

  factory TaskTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TaskTableData(
      id: serializer.fromJson<int>(json['id']),
      description: serializer.fromJson<String>(json['description']),
      isCompleate: serializer.fromJson<bool>(json['isCompleate']),
      projectId: serializer.fromJson<int>(json['projectId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'description': serializer.toJson<String>(description),
      'isCompleate': serializer.toJson<bool>(isCompleate),
      'projectId': serializer.toJson<int>(projectId),
    };
  }

  TaskTableData copyWith({
    int? id,
    String? description,
    bool? isCompleate,
    int? projectId,
  }) => TaskTableData(
    id: id ?? this.id,
    description: description ?? this.description,
    isCompleate: isCompleate ?? this.isCompleate,
    projectId: projectId ?? this.projectId,
  );
  TaskTableData copyWithCompanion(TaskTableCompanion data) {
    return TaskTableData(
      id: data.id.present ? data.id.value : this.id,
      description: data.description.present
          ? data.description.value
          : this.description,
      isCompleate: data.isCompleate.present
          ? data.isCompleate.value
          : this.isCompleate,
      projectId: data.projectId.present ? data.projectId.value : this.projectId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TaskTableData(')
          ..write('id: $id, ')
          ..write('description: $description, ')
          ..write('isCompleate: $isCompleate, ')
          ..write('projectId: $projectId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, description, isCompleate, projectId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TaskTableData &&
          other.id == this.id &&
          other.description == this.description &&
          other.isCompleate == this.isCompleate &&
          other.projectId == this.projectId);
}

class TaskTableCompanion extends UpdateCompanion<TaskTableData> {
  final Value<int> id;
  final Value<String> description;
  final Value<bool> isCompleate;
  final Value<int> projectId;
  const TaskTableCompanion({
    this.id = const Value.absent(),
    this.description = const Value.absent(),
    this.isCompleate = const Value.absent(),
    this.projectId = const Value.absent(),
  });
  TaskTableCompanion.insert({
    this.id = const Value.absent(),
    required String description,
    this.isCompleate = const Value.absent(),
    required int projectId,
  }) : description = Value(description),
       projectId = Value(projectId);
  static Insertable<TaskTableData> custom({
    Expression<int>? id,
    Expression<String>? description,
    Expression<bool>? isCompleate,
    Expression<int>? projectId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (description != null) 'description': description,
      if (isCompleate != null) 'is_compleate': isCompleate,
      if (projectId != null) 'project_id': projectId,
    });
  }

  TaskTableCompanion copyWith({
    Value<int>? id,
    Value<String>? description,
    Value<bool>? isCompleate,
    Value<int>? projectId,
  }) {
    return TaskTableCompanion(
      id: id ?? this.id,
      description: description ?? this.description,
      isCompleate: isCompleate ?? this.isCompleate,
      projectId: projectId ?? this.projectId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (isCompleate.present) {
      map['is_compleate'] = Variable<bool>(isCompleate.value);
    }
    if (projectId.present) {
      map['project_id'] = Variable<int>(projectId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TaskTableCompanion(')
          ..write('id: $id, ')
          ..write('description: $description, ')
          ..write('isCompleate: $isCompleate, ')
          ..write('projectId: $projectId')
          ..write(')'))
        .toString();
  }
}

class $AssignedTaskTableTable extends AssignedTaskTable
    with TableInfo<$AssignedTaskTableTable, AssignedTaskTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AssignedTaskTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<int> userId = GeneratedColumn<int>(
    'user_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES user_table (id)',
    ),
  );
  static const VerificationMeta _taskIdMeta = const VerificationMeta('taskId');
  @override
  late final GeneratedColumn<int> taskId = GeneratedColumn<int>(
    'task_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES task_table (id)',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [id, userId, taskId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'assigned_task_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<AssignedTaskTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('user_id')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta),
      );
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('task_id')) {
      context.handle(
        _taskIdMeta,
        taskId.isAcceptableOrUnknown(data['task_id']!, _taskIdMeta),
      );
    } else if (isInserting) {
      context.missing(_taskIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AssignedTaskTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AssignedTaskTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      userId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}user_id'],
      )!,
      taskId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}task_id'],
      )!,
    );
  }

  @override
  $AssignedTaskTableTable createAlias(String alias) {
    return $AssignedTaskTableTable(attachedDatabase, alias);
  }
}

class AssignedTaskTableData extends DataClass
    implements Insertable<AssignedTaskTableData> {
  final int id;
  final int userId;
  final int taskId;
  const AssignedTaskTableData({
    required this.id,
    required this.userId,
    required this.taskId,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['user_id'] = Variable<int>(userId);
    map['task_id'] = Variable<int>(taskId);
    return map;
  }

  AssignedTaskTableCompanion toCompanion(bool nullToAbsent) {
    return AssignedTaskTableCompanion(
      id: Value(id),
      userId: Value(userId),
      taskId: Value(taskId),
    );
  }

  factory AssignedTaskTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AssignedTaskTableData(
      id: serializer.fromJson<int>(json['id']),
      userId: serializer.fromJson<int>(json['userId']),
      taskId: serializer.fromJson<int>(json['taskId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'userId': serializer.toJson<int>(userId),
      'taskId': serializer.toJson<int>(taskId),
    };
  }

  AssignedTaskTableData copyWith({int? id, int? userId, int? taskId}) =>
      AssignedTaskTableData(
        id: id ?? this.id,
        userId: userId ?? this.userId,
        taskId: taskId ?? this.taskId,
      );
  AssignedTaskTableData copyWithCompanion(AssignedTaskTableCompanion data) {
    return AssignedTaskTableData(
      id: data.id.present ? data.id.value : this.id,
      userId: data.userId.present ? data.userId.value : this.userId,
      taskId: data.taskId.present ? data.taskId.value : this.taskId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AssignedTaskTableData(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('taskId: $taskId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, userId, taskId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AssignedTaskTableData &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.taskId == this.taskId);
}

class AssignedTaskTableCompanion
    extends UpdateCompanion<AssignedTaskTableData> {
  final Value<int> id;
  final Value<int> userId;
  final Value<int> taskId;
  const AssignedTaskTableCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.taskId = const Value.absent(),
  });
  AssignedTaskTableCompanion.insert({
    this.id = const Value.absent(),
    required int userId,
    required int taskId,
  }) : userId = Value(userId),
       taskId = Value(taskId);
  static Insertable<AssignedTaskTableData> custom({
    Expression<int>? id,
    Expression<int>? userId,
    Expression<int>? taskId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (taskId != null) 'task_id': taskId,
    });
  }

  AssignedTaskTableCompanion copyWith({
    Value<int>? id,
    Value<int>? userId,
    Value<int>? taskId,
  }) {
    return AssignedTaskTableCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      taskId: taskId ?? this.taskId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<int>(userId.value);
    }
    if (taskId.present) {
      map['task_id'] = Variable<int>(taskId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AssignedTaskTableCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('taskId: $taskId')
          ..write(')'))
        .toString();
  }
}

abstract class _$ProjectDatabase extends GeneratedDatabase {
  _$ProjectDatabase(QueryExecutor e) : super(e);
  $ProjectDatabaseManager get managers => $ProjectDatabaseManager(this);
  late final $UserTableTable userTable = $UserTableTable(this);
  late final $ProjectsTableTable projectsTable = $ProjectsTableTable(this);
  late final $TaskTableTable taskTable = $TaskTableTable(this);
  late final $AssignedTaskTableTable assignedTaskTable =
      $AssignedTaskTableTable(this);
  late final UserDao userDao = UserDao(this as ProjectDatabase);
  late final TaskDao taskDao = TaskDao(this as ProjectDatabase);
  late final ProjectsDao projectsDao = ProjectsDao(this as ProjectDatabase);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    userTable,
    projectsTable,
    taskTable,
    assignedTaskTable,
  ];
}

typedef $$UserTableTableCreateCompanionBuilder =
    UserTableCompanion Function({
      Value<int> id,
      required String name,
      required String description,
      Value<DateTime?> createdAt,
    });
typedef $$UserTableTableUpdateCompanionBuilder =
    UserTableCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<String> description,
      Value<DateTime?> createdAt,
    });

final class $$UserTableTableReferences
    extends BaseReferences<_$ProjectDatabase, $UserTableTable, UserTableData> {
  $$UserTableTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$ProjectsTableTable, List<ProjectsTableData>>
  _projectsTableRefsTable(_$ProjectDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.projectsTable,
        aliasName: $_aliasNameGenerator(
          db.userTable.id,
          db.projectsTable.userId,
        ),
      );

  $$ProjectsTableTableProcessedTableManager get projectsTableRefs {
    final manager = $$ProjectsTableTableTableManager(
      $_db,
      $_db.projectsTable,
    ).filter((f) => f.userId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_projectsTableRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<
    $AssignedTaskTableTable,
    List<AssignedTaskTableData>
  >
  _assignedTaskTableRefsTable(_$ProjectDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.assignedTaskTable,
        aliasName: $_aliasNameGenerator(
          db.userTable.id,
          db.assignedTaskTable.userId,
        ),
      );

  $$AssignedTaskTableTableProcessedTableManager get assignedTaskTableRefs {
    final manager = $$AssignedTaskTableTableTableManager(
      $_db,
      $_db.assignedTaskTable,
    ).filter((f) => f.userId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _assignedTaskTableRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$UserTableTableFilterComposer
    extends Composer<_$ProjectDatabase, $UserTableTable> {
  $$UserTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> projectsTableRefs(
    Expression<bool> Function($$ProjectsTableTableFilterComposer f) f,
  ) {
    final $$ProjectsTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.projectsTable,
      getReferencedColumn: (t) => t.userId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProjectsTableTableFilterComposer(
            $db: $db,
            $table: $db.projectsTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> assignedTaskTableRefs(
    Expression<bool> Function($$AssignedTaskTableTableFilterComposer f) f,
  ) {
    final $$AssignedTaskTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.assignedTaskTable,
      getReferencedColumn: (t) => t.userId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AssignedTaskTableTableFilterComposer(
            $db: $db,
            $table: $db.assignedTaskTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$UserTableTableOrderingComposer
    extends Composer<_$ProjectDatabase, $UserTableTable> {
  $$UserTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$UserTableTableAnnotationComposer
    extends Composer<_$ProjectDatabase, $UserTableTable> {
  $$UserTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  Expression<T> projectsTableRefs<T extends Object>(
    Expression<T> Function($$ProjectsTableTableAnnotationComposer a) f,
  ) {
    final $$ProjectsTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.projectsTable,
      getReferencedColumn: (t) => t.userId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProjectsTableTableAnnotationComposer(
            $db: $db,
            $table: $db.projectsTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> assignedTaskTableRefs<T extends Object>(
    Expression<T> Function($$AssignedTaskTableTableAnnotationComposer a) f,
  ) {
    final $$AssignedTaskTableTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.assignedTaskTable,
          getReferencedColumn: (t) => t.userId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$AssignedTaskTableTableAnnotationComposer(
                $db: $db,
                $table: $db.assignedTaskTable,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$UserTableTableTableManager
    extends
        RootTableManager<
          _$ProjectDatabase,
          $UserTableTable,
          UserTableData,
          $$UserTableTableFilterComposer,
          $$UserTableTableOrderingComposer,
          $$UserTableTableAnnotationComposer,
          $$UserTableTableCreateCompanionBuilder,
          $$UserTableTableUpdateCompanionBuilder,
          (UserTableData, $$UserTableTableReferences),
          UserTableData,
          PrefetchHooks Function({
            bool projectsTableRefs,
            bool assignedTaskTableRefs,
          })
        > {
  $$UserTableTableTableManager(_$ProjectDatabase db, $UserTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UserTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$UserTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$UserTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> description = const Value.absent(),
                Value<DateTime?> createdAt = const Value.absent(),
              }) => UserTableCompanion(
                id: id,
                name: name,
                description: description,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                required String description,
                Value<DateTime?> createdAt = const Value.absent(),
              }) => UserTableCompanion.insert(
                id: id,
                name: name,
                description: description,
                createdAt: createdAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$UserTableTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({projectsTableRefs = false, assignedTaskTableRefs = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (projectsTableRefs) db.projectsTable,
                    if (assignedTaskTableRefs) db.assignedTaskTable,
                  ],
                  addJoins: null,
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (projectsTableRefs)
                        await $_getPrefetchedData<
                          UserTableData,
                          $UserTableTable,
                          ProjectsTableData
                        >(
                          currentTable: table,
                          referencedTable: $$UserTableTableReferences
                              ._projectsTableRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$UserTableTableReferences(
                                db,
                                table,
                                p0,
                              ).projectsTableRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.userId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (assignedTaskTableRefs)
                        await $_getPrefetchedData<
                          UserTableData,
                          $UserTableTable,
                          AssignedTaskTableData
                        >(
                          currentTable: table,
                          referencedTable: $$UserTableTableReferences
                              ._assignedTaskTableRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$UserTableTableReferences(
                                db,
                                table,
                                p0,
                              ).assignedTaskTableRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.userId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$UserTableTableProcessedTableManager =
    ProcessedTableManager<
      _$ProjectDatabase,
      $UserTableTable,
      UserTableData,
      $$UserTableTableFilterComposer,
      $$UserTableTableOrderingComposer,
      $$UserTableTableAnnotationComposer,
      $$UserTableTableCreateCompanionBuilder,
      $$UserTableTableUpdateCompanionBuilder,
      (UserTableData, $$UserTableTableReferences),
      UserTableData,
      PrefetchHooks Function({
        bool projectsTableRefs,
        bool assignedTaskTableRefs,
      })
    >;
typedef $$ProjectsTableTableCreateCompanionBuilder =
    ProjectsTableCompanion Function({
      Value<int> id,
      required String name,
      required int userId,
    });
typedef $$ProjectsTableTableUpdateCompanionBuilder =
    ProjectsTableCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<int> userId,
    });

final class $$ProjectsTableTableReferences
    extends
        BaseReferences<
          _$ProjectDatabase,
          $ProjectsTableTable,
          ProjectsTableData
        > {
  $$ProjectsTableTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $UserTableTable _userIdTable(_$ProjectDatabase db) =>
      db.userTable.createAlias(
        $_aliasNameGenerator(db.projectsTable.userId, db.userTable.id),
      );

  $$UserTableTableProcessedTableManager get userId {
    final $_column = $_itemColumn<int>('user_id')!;

    final manager = $$UserTableTableTableManager(
      $_db,
      $_db.userTable,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_userIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$TaskTableTable, List<TaskTableData>>
  _taskTableRefsTable(_$ProjectDatabase db) => MultiTypedResultKey.fromTable(
    db.taskTable,
    aliasName: $_aliasNameGenerator(
      db.projectsTable.id,
      db.taskTable.projectId,
    ),
  );

  $$TaskTableTableProcessedTableManager get taskTableRefs {
    final manager = $$TaskTableTableTableManager(
      $_db,
      $_db.taskTable,
    ).filter((f) => f.projectId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_taskTableRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$ProjectsTableTableFilterComposer
    extends Composer<_$ProjectDatabase, $ProjectsTableTable> {
  $$ProjectsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  $$UserTableTableFilterComposer get userId {
    final $$UserTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.userTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UserTableTableFilterComposer(
            $db: $db,
            $table: $db.userTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> taskTableRefs(
    Expression<bool> Function($$TaskTableTableFilterComposer f) f,
  ) {
    final $$TaskTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.taskTable,
      getReferencedColumn: (t) => t.projectId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TaskTableTableFilterComposer(
            $db: $db,
            $table: $db.taskTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ProjectsTableTableOrderingComposer
    extends Composer<_$ProjectDatabase, $ProjectsTableTable> {
  $$ProjectsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  $$UserTableTableOrderingComposer get userId {
    final $$UserTableTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.userTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UserTableTableOrderingComposer(
            $db: $db,
            $table: $db.userTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ProjectsTableTableAnnotationComposer
    extends Composer<_$ProjectDatabase, $ProjectsTableTable> {
  $$ProjectsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  $$UserTableTableAnnotationComposer get userId {
    final $$UserTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.userTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UserTableTableAnnotationComposer(
            $db: $db,
            $table: $db.userTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> taskTableRefs<T extends Object>(
    Expression<T> Function($$TaskTableTableAnnotationComposer a) f,
  ) {
    final $$TaskTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.taskTable,
      getReferencedColumn: (t) => t.projectId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TaskTableTableAnnotationComposer(
            $db: $db,
            $table: $db.taskTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ProjectsTableTableTableManager
    extends
        RootTableManager<
          _$ProjectDatabase,
          $ProjectsTableTable,
          ProjectsTableData,
          $$ProjectsTableTableFilterComposer,
          $$ProjectsTableTableOrderingComposer,
          $$ProjectsTableTableAnnotationComposer,
          $$ProjectsTableTableCreateCompanionBuilder,
          $$ProjectsTableTableUpdateCompanionBuilder,
          (ProjectsTableData, $$ProjectsTableTableReferences),
          ProjectsTableData,
          PrefetchHooks Function({bool userId, bool taskTableRefs})
        > {
  $$ProjectsTableTableTableManager(
    _$ProjectDatabase db,
    $ProjectsTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ProjectsTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ProjectsTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ProjectsTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<int> userId = const Value.absent(),
              }) => ProjectsTableCompanion(id: id, name: name, userId: userId),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                required int userId,
              }) => ProjectsTableCompanion.insert(
                id: id,
                name: name,
                userId: userId,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$ProjectsTableTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({userId = false, taskTableRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (taskTableRefs) db.taskTable],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (userId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.userId,
                                referencedTable: $$ProjectsTableTableReferences
                                    ._userIdTable(db),
                                referencedColumn: $$ProjectsTableTableReferences
                                    ._userIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (taskTableRefs)
                    await $_getPrefetchedData<
                      ProjectsTableData,
                      $ProjectsTableTable,
                      TaskTableData
                    >(
                      currentTable: table,
                      referencedTable: $$ProjectsTableTableReferences
                          ._taskTableRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$ProjectsTableTableReferences(
                            db,
                            table,
                            p0,
                          ).taskTableRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.projectId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$ProjectsTableTableProcessedTableManager =
    ProcessedTableManager<
      _$ProjectDatabase,
      $ProjectsTableTable,
      ProjectsTableData,
      $$ProjectsTableTableFilterComposer,
      $$ProjectsTableTableOrderingComposer,
      $$ProjectsTableTableAnnotationComposer,
      $$ProjectsTableTableCreateCompanionBuilder,
      $$ProjectsTableTableUpdateCompanionBuilder,
      (ProjectsTableData, $$ProjectsTableTableReferences),
      ProjectsTableData,
      PrefetchHooks Function({bool userId, bool taskTableRefs})
    >;
typedef $$TaskTableTableCreateCompanionBuilder =
    TaskTableCompanion Function({
      Value<int> id,
      required String description,
      Value<bool> isCompleate,
      required int projectId,
    });
typedef $$TaskTableTableUpdateCompanionBuilder =
    TaskTableCompanion Function({
      Value<int> id,
      Value<String> description,
      Value<bool> isCompleate,
      Value<int> projectId,
    });

final class $$TaskTableTableReferences
    extends BaseReferences<_$ProjectDatabase, $TaskTableTable, TaskTableData> {
  $$TaskTableTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $ProjectsTableTable _projectIdTable(_$ProjectDatabase db) =>
      db.projectsTable.createAlias(
        $_aliasNameGenerator(db.taskTable.projectId, db.projectsTable.id),
      );

  $$ProjectsTableTableProcessedTableManager get projectId {
    final $_column = $_itemColumn<int>('project_id')!;

    final manager = $$ProjectsTableTableTableManager(
      $_db,
      $_db.projectsTable,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_projectIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<
    $AssignedTaskTableTable,
    List<AssignedTaskTableData>
  >
  _assignedTaskTableRefsTable(_$ProjectDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.assignedTaskTable,
        aliasName: $_aliasNameGenerator(
          db.taskTable.id,
          db.assignedTaskTable.taskId,
        ),
      );

  $$AssignedTaskTableTableProcessedTableManager get assignedTaskTableRefs {
    final manager = $$AssignedTaskTableTableTableManager(
      $_db,
      $_db.assignedTaskTable,
    ).filter((f) => f.taskId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _assignedTaskTableRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$TaskTableTableFilterComposer
    extends Composer<_$ProjectDatabase, $TaskTableTable> {
  $$TaskTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isCompleate => $composableBuilder(
    column: $table.isCompleate,
    builder: (column) => ColumnFilters(column),
  );

  $$ProjectsTableTableFilterComposer get projectId {
    final $$ProjectsTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.projectId,
      referencedTable: $db.projectsTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProjectsTableTableFilterComposer(
            $db: $db,
            $table: $db.projectsTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> assignedTaskTableRefs(
    Expression<bool> Function($$AssignedTaskTableTableFilterComposer f) f,
  ) {
    final $$AssignedTaskTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.assignedTaskTable,
      getReferencedColumn: (t) => t.taskId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AssignedTaskTableTableFilterComposer(
            $db: $db,
            $table: $db.assignedTaskTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$TaskTableTableOrderingComposer
    extends Composer<_$ProjectDatabase, $TaskTableTable> {
  $$TaskTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isCompleate => $composableBuilder(
    column: $table.isCompleate,
    builder: (column) => ColumnOrderings(column),
  );

  $$ProjectsTableTableOrderingComposer get projectId {
    final $$ProjectsTableTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.projectId,
      referencedTable: $db.projectsTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProjectsTableTableOrderingComposer(
            $db: $db,
            $table: $db.projectsTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$TaskTableTableAnnotationComposer
    extends Composer<_$ProjectDatabase, $TaskTableTable> {
  $$TaskTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isCompleate => $composableBuilder(
    column: $table.isCompleate,
    builder: (column) => column,
  );

  $$ProjectsTableTableAnnotationComposer get projectId {
    final $$ProjectsTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.projectId,
      referencedTable: $db.projectsTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProjectsTableTableAnnotationComposer(
            $db: $db,
            $table: $db.projectsTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> assignedTaskTableRefs<T extends Object>(
    Expression<T> Function($$AssignedTaskTableTableAnnotationComposer a) f,
  ) {
    final $$AssignedTaskTableTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.assignedTaskTable,
          getReferencedColumn: (t) => t.taskId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$AssignedTaskTableTableAnnotationComposer(
                $db: $db,
                $table: $db.assignedTaskTable,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$TaskTableTableTableManager
    extends
        RootTableManager<
          _$ProjectDatabase,
          $TaskTableTable,
          TaskTableData,
          $$TaskTableTableFilterComposer,
          $$TaskTableTableOrderingComposer,
          $$TaskTableTableAnnotationComposer,
          $$TaskTableTableCreateCompanionBuilder,
          $$TaskTableTableUpdateCompanionBuilder,
          (TaskTableData, $$TaskTableTableReferences),
          TaskTableData,
          PrefetchHooks Function({bool projectId, bool assignedTaskTableRefs})
        > {
  $$TaskTableTableTableManager(_$ProjectDatabase db, $TaskTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TaskTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TaskTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TaskTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> description = const Value.absent(),
                Value<bool> isCompleate = const Value.absent(),
                Value<int> projectId = const Value.absent(),
              }) => TaskTableCompanion(
                id: id,
                description: description,
                isCompleate: isCompleate,
                projectId: projectId,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String description,
                Value<bool> isCompleate = const Value.absent(),
                required int projectId,
              }) => TaskTableCompanion.insert(
                id: id,
                description: description,
                isCompleate: isCompleate,
                projectId: projectId,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$TaskTableTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({projectId = false, assignedTaskTableRefs = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (assignedTaskTableRefs) db.assignedTaskTable,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (projectId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.projectId,
                                    referencedTable: $$TaskTableTableReferences
                                        ._projectIdTable(db),
                                    referencedColumn: $$TaskTableTableReferences
                                        ._projectIdTable(db)
                                        .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (assignedTaskTableRefs)
                        await $_getPrefetchedData<
                          TaskTableData,
                          $TaskTableTable,
                          AssignedTaskTableData
                        >(
                          currentTable: table,
                          referencedTable: $$TaskTableTableReferences
                              ._assignedTaskTableRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$TaskTableTableReferences(
                                db,
                                table,
                                p0,
                              ).assignedTaskTableRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.taskId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$TaskTableTableProcessedTableManager =
    ProcessedTableManager<
      _$ProjectDatabase,
      $TaskTableTable,
      TaskTableData,
      $$TaskTableTableFilterComposer,
      $$TaskTableTableOrderingComposer,
      $$TaskTableTableAnnotationComposer,
      $$TaskTableTableCreateCompanionBuilder,
      $$TaskTableTableUpdateCompanionBuilder,
      (TaskTableData, $$TaskTableTableReferences),
      TaskTableData,
      PrefetchHooks Function({bool projectId, bool assignedTaskTableRefs})
    >;
typedef $$AssignedTaskTableTableCreateCompanionBuilder =
    AssignedTaskTableCompanion Function({
      Value<int> id,
      required int userId,
      required int taskId,
    });
typedef $$AssignedTaskTableTableUpdateCompanionBuilder =
    AssignedTaskTableCompanion Function({
      Value<int> id,
      Value<int> userId,
      Value<int> taskId,
    });

final class $$AssignedTaskTableTableReferences
    extends
        BaseReferences<
          _$ProjectDatabase,
          $AssignedTaskTableTable,
          AssignedTaskTableData
        > {
  $$AssignedTaskTableTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $UserTableTable _userIdTable(_$ProjectDatabase db) =>
      db.userTable.createAlias(
        $_aliasNameGenerator(db.assignedTaskTable.userId, db.userTable.id),
      );

  $$UserTableTableProcessedTableManager get userId {
    final $_column = $_itemColumn<int>('user_id')!;

    final manager = $$UserTableTableTableManager(
      $_db,
      $_db.userTable,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_userIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $TaskTableTable _taskIdTable(_$ProjectDatabase db) =>
      db.taskTable.createAlias(
        $_aliasNameGenerator(db.assignedTaskTable.taskId, db.taskTable.id),
      );

  $$TaskTableTableProcessedTableManager get taskId {
    final $_column = $_itemColumn<int>('task_id')!;

    final manager = $$TaskTableTableTableManager(
      $_db,
      $_db.taskTable,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_taskIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$AssignedTaskTableTableFilterComposer
    extends Composer<_$ProjectDatabase, $AssignedTaskTableTable> {
  $$AssignedTaskTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  $$UserTableTableFilterComposer get userId {
    final $$UserTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.userTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UserTableTableFilterComposer(
            $db: $db,
            $table: $db.userTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$TaskTableTableFilterComposer get taskId {
    final $$TaskTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.taskId,
      referencedTable: $db.taskTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TaskTableTableFilterComposer(
            $db: $db,
            $table: $db.taskTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$AssignedTaskTableTableOrderingComposer
    extends Composer<_$ProjectDatabase, $AssignedTaskTableTable> {
  $$AssignedTaskTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  $$UserTableTableOrderingComposer get userId {
    final $$UserTableTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.userTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UserTableTableOrderingComposer(
            $db: $db,
            $table: $db.userTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$TaskTableTableOrderingComposer get taskId {
    final $$TaskTableTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.taskId,
      referencedTable: $db.taskTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TaskTableTableOrderingComposer(
            $db: $db,
            $table: $db.taskTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$AssignedTaskTableTableAnnotationComposer
    extends Composer<_$ProjectDatabase, $AssignedTaskTableTable> {
  $$AssignedTaskTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  $$UserTableTableAnnotationComposer get userId {
    final $$UserTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.userTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UserTableTableAnnotationComposer(
            $db: $db,
            $table: $db.userTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$TaskTableTableAnnotationComposer get taskId {
    final $$TaskTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.taskId,
      referencedTable: $db.taskTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TaskTableTableAnnotationComposer(
            $db: $db,
            $table: $db.taskTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$AssignedTaskTableTableTableManager
    extends
        RootTableManager<
          _$ProjectDatabase,
          $AssignedTaskTableTable,
          AssignedTaskTableData,
          $$AssignedTaskTableTableFilterComposer,
          $$AssignedTaskTableTableOrderingComposer,
          $$AssignedTaskTableTableAnnotationComposer,
          $$AssignedTaskTableTableCreateCompanionBuilder,
          $$AssignedTaskTableTableUpdateCompanionBuilder,
          (AssignedTaskTableData, $$AssignedTaskTableTableReferences),
          AssignedTaskTableData,
          PrefetchHooks Function({bool userId, bool taskId})
        > {
  $$AssignedTaskTableTableTableManager(
    _$ProjectDatabase db,
    $AssignedTaskTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AssignedTaskTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AssignedTaskTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AssignedTaskTableTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> userId = const Value.absent(),
                Value<int> taskId = const Value.absent(),
              }) => AssignedTaskTableCompanion(
                id: id,
                userId: userId,
                taskId: taskId,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int userId,
                required int taskId,
              }) => AssignedTaskTableCompanion.insert(
                id: id,
                userId: userId,
                taskId: taskId,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$AssignedTaskTableTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({userId = false, taskId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (userId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.userId,
                                referencedTable:
                                    $$AssignedTaskTableTableReferences
                                        ._userIdTable(db),
                                referencedColumn:
                                    $$AssignedTaskTableTableReferences
                                        ._userIdTable(db)
                                        .id,
                              )
                              as T;
                    }
                    if (taskId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.taskId,
                                referencedTable:
                                    $$AssignedTaskTableTableReferences
                                        ._taskIdTable(db),
                                referencedColumn:
                                    $$AssignedTaskTableTableReferences
                                        ._taskIdTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$AssignedTaskTableTableProcessedTableManager =
    ProcessedTableManager<
      _$ProjectDatabase,
      $AssignedTaskTableTable,
      AssignedTaskTableData,
      $$AssignedTaskTableTableFilterComposer,
      $$AssignedTaskTableTableOrderingComposer,
      $$AssignedTaskTableTableAnnotationComposer,
      $$AssignedTaskTableTableCreateCompanionBuilder,
      $$AssignedTaskTableTableUpdateCompanionBuilder,
      (AssignedTaskTableData, $$AssignedTaskTableTableReferences),
      AssignedTaskTableData,
      PrefetchHooks Function({bool userId, bool taskId})
    >;

class $ProjectDatabaseManager {
  final _$ProjectDatabase _db;
  $ProjectDatabaseManager(this._db);
  $$UserTableTableTableManager get userTable =>
      $$UserTableTableTableManager(_db, _db.userTable);
  $$ProjectsTableTableTableManager get projectsTable =>
      $$ProjectsTableTableTableManager(_db, _db.projectsTable);
  $$TaskTableTableTableManager get taskTable =>
      $$TaskTableTableTableManager(_db, _db.taskTable);
  $$AssignedTaskTableTableTableManager get assignedTaskTable =>
      $$AssignedTaskTableTableTableManager(_db, _db.assignedTaskTable);
}

mixin _$UserDaoMixin on DatabaseAccessor<ProjectDatabase> {
  $UserTableTable get userTable => attachedDatabase.userTable;
}
mixin _$TaskDaoMixin on DatabaseAccessor<ProjectDatabase> {
  $UserTableTable get userTable => attachedDatabase.userTable;
  $ProjectsTableTable get projectsTable => attachedDatabase.projectsTable;
  $TaskTableTable get taskTable => attachedDatabase.taskTable;
}
mixin _$ProjectsDaoMixin on DatabaseAccessor<ProjectDatabase> {
  $UserTableTable get userTable => attachedDatabase.userTable;
  $ProjectsTableTable get projectsTable => attachedDatabase.projectsTable;
}
