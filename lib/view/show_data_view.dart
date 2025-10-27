import 'package:drift/drift.dart' as drift;
import 'package:flutter/material.dart';

import 'package:drift_clear_learn/data/database/project_database.dart';
import 'package:drift_clear_learn/domain/user_service.dart'; 

class ShowData extends StatefulWidget {
  const ShowData({super.key});

  @override
  State<ShowData> createState() => _ShowDataState();
}

class _ShowDataState extends State<ShowData> {

  late ProjectDatabase database;
  late UserService userService;

   @override
  Widget build(BuildContext context) {
    database = ProjectDatabase();
    userService = UserService(database: database);

    return Scaffold(
      appBar: AppBar(title: Text('title')),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: SizedBox(
              height: 300,
              child: Column(
                children: [
                  TextButton(onPressed: createUser, child: Text('create User')),
                  TextButton(
                    onPressed: createProject, 
                    child: Text('create project for first user'),
                  ),
                  TextButton(
                    onPressed: createTaskForFirstProject, 
                    child: Text('create Task For first project'),
                  ),
                  TextButton(
                    onPressed: setAllTaskCompleate, 
                    child: Text('set all tasks compleate'),
                  ),
                  TextButton(
                    onPressed: showUserCards, 
                    child: Text('Show User Cards'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> createUser() async => await database.userDao.putUser();

  Future<void> createProject() async => await database.projectsDao.putProject();

  Future<void> createTaskForFirstProject() async => 
    await database.taskDao.putTask();

  Future<void> setAllTaskCompleate() async => 
    await database.transaction(() async {
      await (database.update(database.taskTable)
        ..where((task) => task.isCompleate.equals(false)))
        .write(const TaskTableCompanion(isCompleate: drift.Value(true)));
    });

  Future<void> showUserCards() async {
    try {
      // Получаем карточки пользователей
      final userCards = await userService.getUserCards();
      
      // Показываем диалог с информацией
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('User Cards (${userCards.length})'),
          content: SizedBox(
            width: double.maxFinite,
            height: 400,
            child: ListView.builder(
              itemCount: userCards.length,
              itemBuilder: (context, index) {
                final card = userCards[index];
                final completedTasks = card.tasks.where((t) => t.isComplete).length;
                final totalTasks = card.tasks.length;
                final progress = totalTasks > 0 ? (completedTasks / totalTasks) * 100 : 0.0;
                
                return Card(
                  margin: EdgeInsets.all(8),
                  child: Padding(
                    padding: EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'User: ${card.user.name}',
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        SizedBox(height: 4),
                        Text('Description: ${card.user.description}'),
                        SizedBox(height: 8),
                        Text(
                          'Статистика:',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text('Всего задач: $totalTasks'),
                        Text('Завершено: $completedTasks'),
                        Text('Прогресс: ${progress.toStringAsFixed(1)}%'),
                        SizedBox(height: 8),
                        Text(
                          'Проекты (${card.projects.length}):',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        ...card.projects.map((project) => Padding(
                          padding: EdgeInsets.only(left: 16, top: 4),
                          child: Text('🔹 ${project.name}'),
                        )),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('Закрыть'),
            ),
          ],
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Ошибка: $e')),
      );
    }
  }
}


class ScreenState{
  final List<UserTableData> users;
  final List<ProjectsTableData> projects;
  final List<TaskTableData> tasks;

  const ScreenState({
    required this.users, 
    required this.projects, 
    required this.tasks});
}