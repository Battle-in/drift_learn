class AssignedTask {
  final int? id;
  final int userId;
  final int taskId;

  const AssignedTask({
    this.id,
    required this.userId,
    required this.taskId,
  });

  AssignedTask copyWith({
    int? id,
    int? userId,
    int? taskId,
  }) {
    return AssignedTask(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      taskId: taskId ?? this.taskId,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is AssignedTask &&
        other.id == id &&
        other.userId == userId &&
        other.taskId == taskId;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        userId.hashCode ^
        taskId.hashCode;
  }

  @override
  String toString() {
    return 'AssignedTask(id: $id, userId: $userId, taskId: $taskId)';
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'taskId': taskId,
    };
  }

  factory AssignedTask.fromJson(Map<String, dynamic> json) {
    return AssignedTask(
      id: json['id'] as int?,
      userId: json['userId'] as int,
      taskId: json['taskId'] as int,
    );
  }
}
