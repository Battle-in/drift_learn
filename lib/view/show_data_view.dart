import 'package:drift/drift.dart' as drift;
import 'package:flutter/material.dart';

import 'package:drift_clear_learn/data/database/project_database.dart';
import 'package:drift_clear_learn/domain/service/database_stream_service.dart';

class ShowData extends StatelessWidget {
  const ShowData({super.key});

  @override
  Widget build(BuildContext context) {
    final database = ProjectDatabase.lazy();
    final streamService = DatabaseStreamService(database);

    return Scaffold(
      appBar: AppBar(title: const Text('Drift Database')),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () => _createUser(context, database),
                          child: const Text('➕ User'),
                        ),
                        ElevatedButton(
                          onPressed: () => _createProject(context, database),
                          child: const Text('➕ Project'),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () => _createTask(context, database),
                          child: const Text('➕ Task'),
                        ),
                        ElevatedButton(
                          onPressed: () => _setAllTasksCompleate(context, database),
                          child: const Text('✅ Done'),
                        ),
                      ],
                    ),
                ],
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(8.0),
            sliver: _buildUserCards(streamService),
          ),
        ],
      ),
    );
  }

  Widget _buildUserCards(DatabaseStreamService streamService) {
    return StreamBuilder<List<UserTableData>>(
      stream: streamService.watchUsers(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const SliverToBoxAdapter(
            child: Center(child: CircularProgressIndicator()),
          );
        }

        if (snapshot.hasError) {
          return SliverToBoxAdapter(
            child: Center(child: Text('Ошибка: ${snapshot.error}')),
          );
        }

        final users = snapshot.data ?? [];

        if (users.isEmpty) {
          return const SliverToBoxAdapter(
            child: Center(
              child: Padding(
                padding: EdgeInsets.all(32.0),
                child: Text('Нет пользователей. Нажмите "➕ User" для создания.'),
              ),
            ),
          );
        }

        return SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) => _buildUserCard(streamService, users[index]),
            childCount: users.length,
          ),
        );
      },
    );
  }

  Widget _buildUserCard(DatabaseStreamService streamService, UserTableData user) {
    return StreamBuilder<List<ProjectsTableData>>(
      stream: streamService.watchProjectsByUserId(user.id),
      builder: (context, projectsSnapshot) {
        final projects = projectsSnapshot.data ?? [];

        return Card(
          margin: const EdgeInsets.only(bottom: 12),
          elevation: 2,
          child: ExpansionTile(
            leading: CircleAvatar(
              child: Text(user.name[0].toUpperCase()),
            ),
            title: Text(
              user.name,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              user.description,
              style: TextStyle(color: Colors.grey[600], fontSize: 12),
            ),
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Проекты (${projects.length}):',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 8),
                    if (projects.isEmpty)
                      const Text(
                        'Нет проектов',
                        style: TextStyle(
                          color: Colors.grey,
                          fontStyle: FontStyle.italic,
                        ),
                      )
                    else
                      ...projects.map(
                        (project) => _buildProjectCard(streamService, project),
                      ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildProjectCard(
    DatabaseStreamService streamService,
    ProjectsTableData project,
  ) {
    return StreamBuilder<List<TaskTableData>>(
      stream: streamService.watchTasksByProjectId(project.id),
      builder: (context, tasksSnapshot) {
        final tasks = tasksSnapshot.data ?? [];
        final completedTasks = tasks.where((t) => t.isCompleate).length;
        final progress =
            tasks.isNotEmpty ? (completedTasks / tasks.length) * 100 : 0.0;

        return Card(
          margin: const EdgeInsets.only(bottom: 8),
          color: Colors.grey[100],
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(Icons.folder, size: 20),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        project.name,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Icon(Icons.task, size: 16, color: Colors.grey[600]),
                    const SizedBox(width: 4),
                    Text(
                      'Задач: ${tasks.length}',
                      style: TextStyle(color: Colors.grey[700], fontSize: 12),
                    ),
                    const SizedBox(width: 16),
                    Icon(
                      Icons.check_circle,
                      size: 16,
                      color: tasks.isNotEmpty && completedTasks == tasks.length
                          ? Colors.green
                          : Colors.grey[400],
                    ),
                    const SizedBox(width: 4),
                    Text(
                      '$completedTasks/${tasks.length}',
                      style: TextStyle(color: Colors.grey[700], fontSize: 12),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                LinearProgressIndicator(
                  value: progress / 100,
                  backgroundColor: Colors.grey[300],
                  valueColor: AlwaysStoppedAnimation<Color>(
                    progress == 100 ? Colors.green : Colors.blue,
                  ),
                ),
                if (tasks.isNotEmpty) ...[
                  const SizedBox(height: 8),
                  ...tasks.map((task) => Padding(
                    padding: const EdgeInsets.only(left: 20, top: 4),
                    child: Row(
                      children: [
                        Icon(
                          task.isCompleate
                              ? Icons.check_box
                              : Icons.check_box_outline_blank,
                          size: 16,
                          color: task.isCompleate ? Colors.green : Colors.grey,
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            task.description,
                            style: TextStyle(
                              decoration: task.isCompleate
                                  ? TextDecoration.lineThrough
                                  : null,
                              color: task.isCompleate
                                  ? Colors.grey
                                  : Colors.black87,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )),
                ],
              ],
            ),
          ),
        );
      },
    );
  }

  void _createUser(BuildContext context, ProjectDatabase database) async {
    await database.userDao.putUser();
    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Пользователь создан')),
      );
    }
  }

  void _createProject(BuildContext context, ProjectDatabase database) async {
    await database.projectsDao.putProject();
    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Проект создан')),
      );
    }
  }

  void _createTask(BuildContext context, ProjectDatabase database) async {
    await database.taskDao.putTask();
    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Задача создана')),
      );
    }
  }

  void _setAllTasksCompleate(BuildContext context, ProjectDatabase database) async {
    await database.transaction(() async {
      await (database.update(database.taskTable)
            ..where((task) => task.isCompleate.equals(false)))
          .write(const TaskTableCompanion(isCompleate: drift.Value(true)));
    });
    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Все задачи выполнены')),
      );
    }
  }
}
