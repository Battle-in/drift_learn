
import 'package:drift_clear_learn/domain/model/models.dart';
import 'package:drift_clear_learn/data/database/project_database.dart';

class UserService {
  UserService({required this.database});

  final ProjectDatabase database;

  Future<List<User>> getAllUsers() async {
    final userTableData = await database.userDao.getAll();
    return userTableData.map((data) => User(
      id: data.id,
      name: data.name,
      description: data.description,
      createdAt: data.createdAt,
    )).toList();
  }

  // Простой метод получения карточек пользователей
  Future<List<UserCard>> getUserCards() async {
    final results = await database.userDao.getUserWithProjectsAndTasksJson();
    
    // Группируем результаты по пользователям
    final Map<int, UserCard> userCards = {};
    
    for (final row in results) {
      final userId = row['user_id'] as int;
      
      // Создаем пользователя если его еще нет
      if (!userCards.containsKey(userId)) {
        final user = User(
          id: userId,
          name: row['user_name'] as String,
          description: row['user_description'] as String,
          createdAt: row['user_created_at'] as DateTime?,
        );
        userCards[userId] = UserCard(
          user: user, 
          projects: [], 
          tasks: []
        );
      }
      
      // Добавляем проект если он есть
      final projectId = row['project_id'] as int?;
      if (projectId != null) {
        final projectName = row['project_name'] as String;
        final projectUserId = row['project_user_id'] as int;
        
        final project = Project(
          id: projectId,
          name: projectName,
          userId: projectUserId,
        );
        
        // Проверяем, есть ли уже такой проект
        final projectExists = userCards[userId]!.projects
            .any((p) => p.id == projectId);
        
        if (!projectExists) {
          userCards[userId]!.projects.add(project);
        }
        
        // Добавляем задачу если она есть
        final taskId = row['task_id'] as int?;
        if (taskId != null) {
          final taskDescription = row['task_description'] as String;
          final taskIsComplete = (row['task_is_complete'] as int) == 1;
          final taskProjectId = row['task_project_id'] as int;
          
          final task = Task(
            id: taskId,
            description: taskDescription,
            isComplete: taskIsComplete,
            projectId: taskProjectId,
          );
          
          // Проверяем, нет ли уже такой задачи
          final taskExists = userCards[userId]!.tasks
              .any((t) => t.id == taskId);
          if (!taskExists) {
            userCards[userId]!.tasks.add(task);
          }
        }
      }
    }
    
    return userCards.values.toList();
  }
}