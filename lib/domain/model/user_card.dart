import 'user.dart';
import 'project.dart';
import 'task.dart';

class UserCard {
  final User user;
  final List<Project> projects;
  final List<Task> tasks;

  const UserCard({
    required this.user,
    required this.projects,
    required this.tasks,
  });

  Map<String, dynamic> toJson() {
    return {
      'user': user.toJson(),
      'projects': projects.map((p) => p.toJson()).toList(),
      'tasks': tasks.map((t) => t.toJson()).toList(),
    };
  }

  factory UserCard.fromJson(Map<String, dynamic> json) {
    return UserCard(
      user: User.fromJson(json['user'] as Map<String, dynamic>),
      projects: (json['projects'] as List)
          .map((p) => Project.fromJson(p as Map<String, dynamic>))
          .toList(),
      tasks: (json['tasks'] as List)
          .map((t) => Task.fromJson(t as Map<String, dynamic>))
          .toList(),
    );
  }

  @override
  String toString() {
    return 'UserCard(user: ${user.name}, projects: ${projects.length}, tasks: ${tasks.length})';
  }
}
